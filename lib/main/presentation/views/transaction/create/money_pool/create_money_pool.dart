import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/functions.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/money_pool/widget.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

enum FormState {
  transactionEntry,
  contributorsSelection,
}

class CreateMoneyPoolTransaction extends StatefulWidget {
  static const String routeName = '/create/money_pool';
  const CreateMoneyPoolTransaction({super.key});

  @override
  State<CreateMoneyPoolTransaction> createState() =>
      _CreateMoneyPoolTransactionState();
}

class _CreateMoneyPoolTransactionState extends State<CreateMoneyPoolTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  //Form Variables
  List<User> contributors = [];
  FormState state = FormState.transactionEntry;
  User? currentUser;
  String paymentFrequency = 'Monthly';
  String currency = 'NGN';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          //Main UI
          BlocConsumer<TransactionBloc, TransactionBlocState>(
            listener: (context, transactionState) {
              if( transactionState.status == TransactionBlocStatus.transactionCreated ) {
                //Notify Members
                initialNotification(context, transactionState.transaction!, transactionState);
              }

              if(transactionState.status == TransactionBlocStatus.transactionUpdated ) {
                //RefreshHistory
                context.read<TransactionBloc>().add(
                    TransactionEvent.getUsersHistory(currentUser?.id??-1, AppConstants.pageSize, 1, transactionState)
                );

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
              return BlocBuilder<UserBloc, UserState> (
                builder: (context, userState) {
                  currentUser = userState.user;

                  if(currentUser == null) {
                    context.read<UserBloc>().add(UserEvent.currentUser(userState));
                  }
                  else {
                    contributors.contains(currentUser)?null: contributors.add(currentUser!);
                  }

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.s8, horizontal: AppSize.s16),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: MediaQuery.of(context).viewPadding.top),
                      FormIndicator(
                        currentStep: state == FormState.transactionEntry?0:1,
                        steps: 2,
                        width: width,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create Money Pool", style: appTextBlack18Bold),
                        ],
                      ),
                      const SizedBox(height: AppSize.s32),
                      Expanded(
                        child: SingleChildScrollView(
                          child: state == FormState.transactionEntry?
                          Column(
                            children: [
                              AppTextInput(
                                  title: 'Transaction Title',
                                  type: TextInputType.text,
                                  hint: 'Money pool for 1m',
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
                                  setState(() {
                                    currency = index == 1 ? 'GBP' : 'NGN';
                                  });
                                },
                              ),
                              const SizedBox(height: AppSize.s16),
                              AppSelectInput(
                                title: 'Select Payment Type',
                                hint: paymentFrequency,
                                width: width,
                                menuList: const ['Weekly', 'Monthly'],
                                onSelect: (result) {
                                  if(result!=null) {
                                    setState(() {
                                      paymentFrequency = result;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(height: AppSize.s16),
                              AppTextInput(
                                  title: 'Amount ($paymentFrequency Payout)',
                                  type: TextInputType.number,
                                  hint: '0',
                                  currencySymbol: currencySymbolFor(currency),
                                  controller: amountController
                              ),
                            ],
                          ):
                          AddContributorsWidget(
                            width: width,
                            title: titleController.value.text,
                            user: currentUser!,
                            amount: double.parse(amountController.value.text),
                            paymentType: paymentFrequency,
                            date: DateTime.now().add(Duration(days: dayPerCycle(paymentFrequency))),
                            contributors: contributors,
                            onAddContributor: (user) {
                              if(user.id!=currentUser?.id) {
                                setState(() {
                                  contributors.add(user);
                                });
                              }else {
                                showSnackBar(context: context, message: 'Cannot select yourself');
                              }
                            },
                            onEditContributor: (users) {
                              setState(() {
                                contributors = users;
                              });
                            },
                          ),
                        )

                      )
                    ]),
                  );
                }
              );
            }
          ),

          //Main Button
          BlocBuilder<TransactionBloc, TransactionBlocState>(
            builder: (context, transactionState) {
              return Positioned(
                bottom: AppSize.s16,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  child: PrimaryButton(
                    width: double.infinity,
                    title: "Continue",
                    onTap: () async {
                      print(validate());
                      if(state == FormState.transactionEntry){
                        if(validate()) {
                          setState(() {
                            state = FormState.contributorsSelection;
                          });
                        }
                      } else if(state == FormState.contributorsSelection){
                        if(contributors.length>1){
                          //Create Transaction
                          Transaction transaction = Transaction(
                              userId: currentUser?.id,
                              title: titleController.text,
                              type: TransactionType.moneyPool,
                              currency: currency,
                              total: amountController.value.text.isEmpty?0: double.parse(amountController.value.text),
                              status: TransactionStatus.pending,
                              percentageComplete: 0,
                              members: contributors,
                              dateCreated: DateTime.now(),
                              expiryDate: getTransactionExpirationDate(contributors, paymentFrequency),
                              obligations: generateObligation(
                                  contributors,
                                  double.parse(amountController.value.text),
                                  paymentFrequency
                              )

                          );

                          _createTransaction(context, transaction, transactionState);
                        }
                        else {
                          showSnackBar(context: context, message: 'Must have at least 2 contributor');
                        }
                      }
                    }
                  ),
                )
              );
            }
          ),

          //Loading Overlay
          BlocBuilder<TransactionBloc, TransactionBlocState> (
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

  void _createTransaction(BuildContext context, Transaction transaction, TransactionBlocState state) {
    context.read<TransactionBloc>().add(TransactionEvent.createTransaction(transaction, state, null));
  }

  DateTime getTransactionExpirationDate(List<User> members, String frequency) {
    return DateTime.now().add(Duration(days: members.length * dayPerCycle(frequency)));
  }

  int dayPerCycle(String frequency) {
    switch (frequency){
      case 'Weekly':
        return 7;
      default:
        return 30;
    }
  }

  List<Obligation> generateObligation(List<User> contributors, double amount, String paymentFrequency) {
    final contributionAmount = amount/contributors.length;
    final amountOfCycles = contributors.length;
    final daysPerCycle = dayPerCycle(paymentFrequency);

    List<Obligation> obligations = [];

    for (var i = 0; i < amountOfCycles; i++) {
      final date = DateTime.now().add(Duration(days: (i+1)*daysPerCycle));
      for (var contributor in contributors) {
        obligations.add(Obligation(
          title: 'money pool payment', 
          status: contributor.id==currentUser?.id?ObligationStatus.verified: ObligationStatus.pending,
          type: ObligationType.payment, 
          binding: contributor.id, 
          dueDate: date,
          amount: contributionAmount
        ));
      }

      obligations.add(Obligation(
        title: 'money pool payout', 
        status: ObligationStatus.pending, 
        type: ObligationType.payout, 
        binding: contributors[i%contributors.length].id, 
        dueDate: date,
        amount: amount
      ));
    }
    return obligations;
  }


  bool validate() {
    bool entryValidated = titleController.value.text.isNotEmpty &&
      amountController.value.text.isNotEmpty;

    if(!entryValidated) {
      showSnackBar(context: context, message: 'Please fill all fields');
    }

    return entryValidated;
  }
}