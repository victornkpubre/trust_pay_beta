import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/add_btn.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/obligation_card.dart';
import 'package:trust_pay_beta/components/data_cards/seller_card.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/base/user_search_view.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';


import '../../../../../app/routes.dart';
import '../../../../../domain/entities/entities.dart';
import '../../view/transaction_details_view.dart';

enum FormState { transactionEntry, obligationDetails, obligationEntry }

class CreateSecureSalesTransaction extends StatefulWidget {
  static const String routeName = '/create/secure_sales';
  const CreateSecureSalesTransaction({super.key});

  @override
  State<CreateSecureSalesTransaction> createState() =>
      _CreateSecureSalesTransactionState();
}

class _CreateSecureSalesTransactionState
    extends State<CreateSecureSalesTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController obligationTitleController =
      TextEditingController();
  final TextEditingController obligationDescriptionController =
      TextEditingController();
  final TextEditingController obligationAmountController =
      TextEditingController();

  //Form Variables
  User? user;
  DateTime? date;
  List<Obligation> obligations = [];
  FormState state = FormState.transactionEntry;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    context.read<UserBloc>().add(const UserEvent.currentUser());

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s8, horizontal: AppSize.s16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              FormIndicator(
                currentStep: getStep(state),
                steps: 2,
                width: width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create Secure Sales", style: appTextBlack18Bold),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocConsumer<TransactionBloc, TransactionState>(
                      listener: (context, transactionState) {
                        if( transactionState.status == TransactionBlocStatus.transactionCreated ) {
                          //Notify Members
                          final user = transactionState.transaction!.members.firstWhere((u) => u.id==transactionState.transaction!.userId);
                          initialNotification(transactionState.transaction!, user);

                          //Navigate to Transaction view page
                          Navigator.pushNamed(
                              context,
                              Routes.transactionsDetails,
                              arguments: TransactionDetailsViewArguments(
                                  transaction: transactionState.transaction!,
                                  viewType: TransactionDetailsViewState.payment
                              )
                          );
                        }
                      },
                      builder: (context, transactionState) {

                      return Stack(
                        children: [
                          BlocBuilder<UserBloc, UserState>(
                          builder: (context, userState) {
                            return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state == FormState.transactionEntry
                                  ? _buildTransactionEntries(
                                      context: context,
                                      titleController: titleController,
                                      width: width,
                                      user: user,
                                      state: state,
                                      onDateSelected: (datetime) {
                                        setState(() {
                                          date = datetime;
                                        });
                                      },
                                      onCancel: () {
                                        setState(() {
                                          user = null;
                                          state = FormState.transactionEntry;
                                        });
                                      },
                                      onSellerSelected: (result) {
                                        setState(() {
                                          if(result?.id != userState.user?.id) {
                                            print(userState.user?.id);
                                            user = result;
                                          }
                                          else {
                                            toast(message: 'Cant make a transaction with your self');
                                          }
                                        });
                                      })
                                  : _buildObligationForm(
                                      width: width,
                                      context: context,
                                      obligations: obligations,
                                      date: date!,
                                      user: user,
                                      currentUser: userState.user,
                                      onCancel: () {
                                        setState(() {
                                          user = null;
                                          state = FormState.transactionEntry;
                                        });
                                      },
                                      onCreateObligation: () {
                                        setState(() {
                                          state = FormState.obligationEntry;
                                        });
                                      },
                                      onAddObligation: (result) {
                                        setState(() {
                                          obligations.addAll(result);
                                          state = FormState.obligationDetails;
                                        });
                                      },
                                      state: state,
                                      obligationTitleController:
                                          obligationTitleController,
                                      obligationDescriptionController:
                                          obligationDescriptionController,
                                      obligationAmountController:
                                          obligationAmountController),
                              const SizedBox(height: AppSize.s16),
                              state == FormState.transactionEntry &&
                                      state != FormState.obligationEntry
                                  ? const SizedBox(height: AppSize.s32)
                                  : Container(),
                            ],
                          );
  },
),
                        ],
                      );
                    },
                  ),
                ),
              )
            ]),
          ),
          BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, transactionState) {
              return BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  User? currentUser = userState.user;
                  return Positioned(
                      bottom: AppSize.s32,
                      left: 0,
                      right: 0,
                      child: state != FormState.obligationEntry
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s16),
                              child: PrimaryButton(
                                active: transactionState.status != TransactionBlocStatus.loading ,
                                  width: double.infinity,
                                  title: state == FormState.transactionEntry?
                                    'Continue': 'Proceed',
                                  onTap: () {
                                    if (user != null && state == FormState.transactionEntry) {
                                      if (titleController.text.isNotEmpty &&
                                          date != null) {
                                        setState(() {
                                          state = FormState.obligationDetails;
                                        });
                                      } else {
                                        toast(message: "Enter Transaction Title and Date");
                                      }
                                    }
                                    else {
                                      if (state == FormState.obligationDetails) {
                                        if(currentUser != null) {
                                          //Create Transaction
                                          Transaction transaction = Transaction(
                                              userId: currentUser.id,
                                              title: titleController.text,
                                              type: TransactionType.secureSales,
                                              total: obligations.fold(0, (i, value) {
                                                return i + value.amount;
                                              }),
                                              status: TransactionStatus.pending,
                                              percentageComplete: 0,
                                              members: [currentUser, user!],
                                              dateCreated: DateTime.now(),
                                              expiryDate: date!,
                                              obligations: obligations
                                          );

                                          createTransaction(context, transaction);
                                        }
                                      }
                                    }
                                  }),
                            )
                          : Container());
                },
              );
            }
          ),
        ],
      ),
    );
  }

  void initialNotification(Transaction transaction, User user) {
    // context.read<TransactionBloc>().add(TransactionEvent.initialNotification(transaction, user,  "Transaction Request"));
  }
}

void createTransaction(BuildContext context, Transaction transaction) {
  context.read<TransactionBloc>().add(TransactionEvent.createTransaction(transaction));
}

int getStep(FormState state) {
  switch (state) {
    case FormState.transactionEntry:
      return 0;
    case FormState.obligationEntry:
      return 1;
    case FormState.obligationDetails:
      return 1;
    default:
      return 0;
  }
}

_buildObligationForm({
  required double width,
  required BuildContext context,
  required List<Obligation> obligations,
  required User? user,
  required User? currentUser,
  required DateTime date,
  required FormState state,
  required TextEditingController obligationTitleController,
  required TextEditingController obligationDescriptionController,
  required TextEditingController obligationAmountController,
  required Function() onCancel,
  required Function() onCreateObligation,
  required Function(List<Obligation>) onAddObligation,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: AppSize.s16),
      const Row(
        children: [Text('Seller')],
      ),
      const SizedBox(height: AppSize.s8),
      SellerDataCard(
          expanded: false,
          width: width,
          profileImage: user?.profileImage??ProfileIconAssets.avatar,
          username: user!.businessName ?? 'No business name',
          accountNumber: user.account?.accountNumber?.toString() ?? '102314',
          trades: '${user.userStatistics?.allTransactions ?? 0}',
          completionRate: '${getCompletionRate(user.userStatistics)}%',
          onCancel: onCancel
      ),
      const SizedBox(height: AppSize.s32),
      const Row(
        children: [Text('Obligations')],
      ),
      const SizedBox(height: AppSize.s8),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: obligations.map((o) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              o.type==ObligationType.delivery? ObligationCard(
                  width: width,
                  title: o.title,
                  description: o.details!,
                  amount: o.amount.toString()): Container(),
              const SizedBox(height: AppSize.s16),
            ],
          );
        }).toList(),
      ),
      const SizedBox(height: AppSize.s8),
      state != FormState.obligationEntry
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AddButtton(
                    title: 'Add',
                    solid: true,
                    onTap: () {
                      onCreateObligation();
                    }),
              ],
            )
          : Container(),
      state == FormState.obligationEntry
          ? Column(
              children: [
                obligations.isNotEmpty
                    ? Divider(thickness: 2, color: AppColor.lightGray)
                    : Container(),
                const SizedBox(height: AppSize.s8),
                AppSecondaryTextInput(
                    width: MediaQuery.of(context).size.width,
                    hint: 'Name the obligation',
                    controller: obligationTitleController),
                const SizedBox(height: AppSize.s16),
                AppTextAreaInput(
                  controller: obligationDescriptionController,
                  hint: 'Describe the obligation',
                ),
                const SizedBox(height: AppSize.s16),
                AppSecondaryTextInput(
                  hint: 'Enter Amount',
                  width: width,
                  type: TextInputType.number,
                  controller: obligationAmountController,
                ),
                const SizedBox(height: AppSize.s16),
                SecondaryButton(
                    title: 'Add',
                    onTap: () {
                      //add to obligation list
                      Obligation deliveryObligation = Obligation(
                          title: obligationTitleController.text,
                          status: ObligationStatus.pending,
                          type: ObligationType.delivery,
                          amount: (double.parse(obligationAmountController.text
                              .replaceAll('.', '')
                              .replaceAll(',', ''))),
                          details: obligationDescriptionController.text,
                          binding: user.id,
                          dueDate: date
                      );

                      Obligation paymentObligation = Obligation(
                          title: obligationTitleController.text,
                          status: ObligationStatus.pending,
                          type: ObligationType.payment,
                          amount: (double.parse(obligationAmountController.text
                              .replaceAll('.', '')
                              .replaceAll(',', ''))),
                          details: obligationDescriptionController.text,
                          binding: currentUser?.id,
                          dueDate: date
                      );


                      onAddObligation([deliveryObligation, paymentObligation]);

                      //clear obligation controllers
                      obligationTitleController.text = '';
                      obligationDescriptionController.text = '';
                      obligationAmountController.text = '';

                    }),
              ],
            )
          : Container(),
      const SizedBox(height: AppSize.s64),
    ],
  );
}

getCompletionRate(UserStatistics? userStats) {
  var result =
      userStats == null ? 0 : userStats.completed / userStats.allTransactions;
  return (result) * 100;
}

_buildTransactionEntries(
    {required BuildContext context,
    required titleController,
    required width,
    required User? user,
    required FormState state,
    required onDateSelected,
    required onCancel,
    required Function(User?) onSellerSelected}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: AppSize.s16),
      AppTextInput(
          title: 'Transaction Title',
          type: TextInputType.text,
          hint: 'Transaction with John',
          controller: titleController),
      const SizedBox(height: AppSize.s16),
      AppDateInput(
        title: 'Expiration Date',
        onDateSelected: onDateSelected,
      ),
      const SizedBox(height: AppSize.s16),
      user != null
          ? SellerDataCard(
            expanded: false,
            width: width,
            profileImage: user.profileImage,
            username: user.businessName ?? 'No business name',
            accountNumber: user.account?.accountNumber?.toString() ?? 'No account',
            trades: '${user.userStatistics?.allTransactions ?? 0}',
            completionRate: '${getCompletionRate(user.userStatistics)}%',
            onCancel: onCancel
          )
          : AppSelectInput(
              width: double.infinity,
              title: "Add Seller",
              hint: "Select User",
              onSelect: (selection) async {
                User result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserSearchView()));
                onSellerSelected(result);
              },
            ),
    ],
  );
}
