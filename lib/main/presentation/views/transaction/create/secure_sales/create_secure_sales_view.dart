import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/add_btn.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/obligation_card.dart';
import 'package:trust_pay_beta/components/data_cards/seller_card.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/presentation/base/functions.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/intents/user_search_view.dart';
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

class _CreateSecureSalesTransactionState extends State<CreateSecureSalesTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController obligationTitleController = TextEditingController();
  final TextEditingController obligationDescriptionController = TextEditingController();
  final TextEditingController obligationAmountController = TextEditingController();
  // What the seller must do: hand over goods, or be present in person.
  final ValueNotifier<ObligationType> obligationType = ValueNotifier(ObligationType.delivery);

  //Form Variables
  User? user;
  DateTime? date;
  String currency = 'NGN';
  List<Obligation> obligations = [];
  FormState state = FormState.transactionEntry;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          //Main UI
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s8, horizontal: AppSize.s16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              FormIndicator(
                currentStep: _getStep(state),
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
                  child: BlocConsumer<TransactionBloc, TransactionBlocState>(
                    listener: (context, transactionState) {
                      if( transactionState.status == TransactionBlocStatus.transactionCreated ) {
                        //Notify Members
                        initialNotification(context, transactionState.transaction!, transactionState);
                      }

                      if(transactionState.status == TransactionBlocStatus.transactionUpdated ) {
                        //RefreshHistory
                        context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(user?.id??-1, AppConstants.pageSize, 1, transactionState));

                        //Navigate to Transaction view page
                        Navigator.pushReplacementNamed(
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

                      return BlocBuilder<UserBloc, UserState>(
                        builder: (context, userState) {

                          if(userState.user == null){
                            context.read<UserBloc>().add(UserEvent.currentUser(userState));
                          }

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
                                          showSnackBar(context: context, message: 'Cant make a transaction with your self');
                                        }
                                      });
                                    },
                                    currency: currency,
                                    onCurrencySelected: (selected) {
                                      setState(() {
                                        currency = selected;
                                      });
                                    })
                                : _buildObligationForm(
                                    width: width,
                                    context: context,
                                    obligations: obligations,
                                    date: date!,
                                    user: user,
                                    currentUser: userState.user,
                                    currency: currency,
                                    onCancel: () {
                                      setState(() {
                                        user = null;
                                        state = FormState.transactionEntry;
                                      });
                                    },
                                    onClose: () {
                                      setState(() {
                                        state = FormState.obligationDetails;
                                      });
                                    },
                                    onCreateObligation: () {
                                      setState(() {
                                        state = FormState.obligationEntry;
                                      });
                                    },
                                    obligationType: obligationType,
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
                      );
                    },
                  ),
                ),
              )
            ]),
          ),

          //Main Button
          BlocBuilder<TransactionBloc, TransactionBlocState>(
              builder: (context, transactionState) {
              return BlocBuilder<UserBloc, UserState> (
                builder: (context, userState) {
                  User? currentUser = userState.user;

                  if(currentUser == null) {
                    context.read<UserBloc>().add(UserEvent.currentUser(userState));
                  }

                  return Positioned(
                    bottom: AppSize.s32,
                    left: 0,
                    right: 0,
                    child: state != FormState.obligationEntry?
                    Padding(padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                      child: PrimaryButton(
                        // active: transactionState.status != TransactionBlocStatus.loading,
                        width: double.infinity,
                        title: state == FormState.transactionEntry? 'Continue': 'Proceed',
                        onTap: () {
                          if (user != null && state == FormState.transactionEntry) {
                            if (date != null && !isFutureExpiry(date)) {
                              showSnackBar(context: context, message: pastExpiryMessage);
                              return;
                            }
                            if (titleController.text.isNotEmpty &&
                                date != null) {
                              setState(() {
                                state = FormState.obligationDetails;
                              });
                            } else {
                              showSnackBar(context: context, message: "Enter Transaction Title and Date");
                            }
                          }
                          else {
                            if (state == FormState.obligationDetails) {
                              if(currentUser != null) {
                                //Payment Obligation
                                obligations.insert (0, Obligation(
                                    title: "Secure sales buyer payment",
                                    status: ObligationStatus.pending,
                                    type: ObligationType.payment,
                                    amount: obligations.fold(0, (prev, o) => o.type.isFulfilment?prev+o.amount: prev),
                                    details: "Secure sales buyer payment",
                                    binding: currentUser.id,
                                    dueDate: date!
                                ));

                                //Create Transaction
                                Transaction transaction = Transaction(
                                    userId: currentUser.id,
                                    title: titleController.text,
                                    type: TransactionType.secureSales,
                                    currency: currency,
                                    total: obligations.where((o) => o.type==ObligationType.payment) .fold(0, (i, value) => i + value.amount),
                                    status: TransactionStatus.pending,
                                    percentageComplete: 0,
                                    members: [currentUser, user!],
                                    dateCreated: DateTime.now(),
                                    expiryDate: date!,
                                    obligations: obligations
                                );

                                _createTransaction(context, transaction, transactionState);
                              }
                            }
                          }
                        }
                      ),
                    ): Container()
                  );
                },
              );
            }
          ),

          //Loading Overlay
          BlocBuilder<TransactionBloc, TransactionBlocState>(
            builder: (context, transactionState) {
              return BlocBuilder<UserBloc, UserState> (
                builder: (context, userState) {
                  return transactionState.status==TransactionBlocStatus.loading || userState.status==UserBlocStatus.loading?
                  Container(
                    width: width,
                    height: height,
                    color: Colors.black.withOpacity(0.25),
                    child: const Center(
                      child: AppCircleProgressIndicator(),
                    ),
                  ): Container();
                }
              );
            }
          ),
        ],
      ),
    );
  }
}

void _createTransaction(BuildContext context, Transaction transaction, TransactionBlocState state) {
  context.read<TransactionBloc>().add(TransactionEvent.createTransaction(transaction, state, null));
}

int _getStep(FormState state) {
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
  required String currency,
  required FormState state,
  required TextEditingController obligationTitleController,
  required TextEditingController obligationDescriptionController,
  required TextEditingController obligationAmountController,
  required ValueNotifier<ObligationType> obligationType,
  required Function() onCancel,
  required Function() onClose,
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
          completionRate: '${_getCompletionRate(user.userStatistics)}%',
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
              o.type.isFulfilment? ObligationCard(
                  width: width,
                  title: '${o.title} (${o.type.label})',
                  description: o.details!,
                  amount: o.amount.toString(),
                  currencySymbol: currencySymbolFor(currency)): Container(),
              const SizedBox(height: AppSize.s16),
            ],
          );
        }).toList(),
      ),
      obligations.any((o) => o.type.isFulfilment)?
      Padding(
        padding: const EdgeInsets.only(bottom: AppSize.s8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.photo_camera, size: 18, color: AppColor.amber),
            const SizedBox(width: AppSize.s8),
            Expanded(
              child: Text(
                'The seller adds a photo or video proof with GPS location when fulfilling: '
                'required for deliveries, recommended for attendance.',
                style: appTextGray14,
              ),
            ),
          ],
        ),
      ): Container(),
      const SizedBox(height: AppSize.s8),

      state != FormState.obligationEntry?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AddButtton(
            title: 'Add',
            solid: true,
            onTap: () {
              onCreateObligation();
            }
          ),
        ],
      ): Container(),

      state == FormState.obligationEntry?
      Column(
        children: [
          obligations.isNotEmpty? Divider(thickness: 2, color: AppColor.lightGray): Container(),
          const SizedBox(height: AppSize.s8),

          AppSecondaryDropDownInput(
            width: width,
            items: const ['Delivery: seller hands over goods', 'Attendance: seller is present in person'],
            onSelect: (index) {
              obligationType.value = index == 0 ? ObligationType.delivery : ObligationType.attendance;
            },
          ),
          const SizedBox(height: AppSize.s16),

          AppSecondaryTextInput(
            width: MediaQuery.of(context).size.width,
            hint: 'Name the obligation',
            controller: obligationTitleController
          ),
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
            currencySymbol: currencySymbolFor(currency),
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
                type: obligationType.value,
                amount: (double.parse(obligationAmountController.text.replaceAll('.', '').replaceAll(',', ''))),
                details: obligationDescriptionController.text,
                binding: user.id,
                dueDate: date
              );

              Obligation payoutObligation = Obligation(
                title: obligationTitleController.text,
                status: ObligationStatus.pending,
                type: ObligationType.payout,
                amount: (double.parse(obligationAmountController.text.replaceAll('.', '').replaceAll(',', ''))),
                details: obligationDescriptionController.text,
                binding: currentUser?.id,
                dueDate: date
              );

              onAddObligation([deliveryObligation, payoutObligation]);

              //clear obligation controllers
              obligationTitleController.text = '';
              obligationDescriptionController.text = '';
              obligationAmountController.text = '';
              obligationType.value = ObligationType.delivery;
            }
          ),

          const SizedBox(height: AppSize.s16),

          SecondaryButton(
              title: 'Cancel',
              onTap: () {
                onClose();
              }
          ),
        ],
      ): Container(),
      const SizedBox(height: AppSize.s64),
    ],
  );
}

_getCompletionRate(UserStatistics? userStats) {
  var result = userStats == null ? 0 : userStats.completed / userStats.allTransactions;
  return (result) * 100;
}

_buildTransactionEntries({
    required BuildContext context,
    required titleController,
    required width,
    required User? user,
    required FormState state,
    required onDateSelected,
    required onCancel,
    required Function(User?) onSellerSelected,
    required String currency,
    required Function(String) onCurrencySelected}) {
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

      Align(
        alignment: Alignment.centerLeft,
        child: Text("Currency", style: appTextPrimary16Bold),
      ),
      const SizedBox(height: 6),
      AppSecondaryDropDownInput(
        width: width,
        items: const ['🇳🇬 NGN', '🇬🇧 GBP'],
        onSelect: (index) {
          onCurrencySelected(index == 1 ? 'GBP' : 'NGN');
        },
      ),
      const SizedBox(height: AppSize.s16),

      AppDateInput(
        title: 'Expiration Date',
        firstDate: earliestExpiryDate(),
        onDateSelected: onDateSelected,
      ),
      const SizedBox(height: AppSize.s16),

      user != null?
      SellerDataCard(
            expanded: false,
            width: width,
            profileImage: user.profileImage,
            username: user.businessName ?? 'No business name',
            accountNumber: user.account?.accountNumber?.toString() ?? 'No account',
            trades: '${user.userStatistics?.allTransactions ?? 0}',
            completionRate: '${_getCompletionRate(user.userStatistics)}%',
            onCancel: onCancel
      ):
      AppSelectInput(
        width: double.infinity,
        title: "Add Seller",
        hint: "Select User",
        onSelect: (selection) async {
          User result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserSearchView())
          );
          onSellerSelected(result);
        },
      ),
    ],
  );
}
