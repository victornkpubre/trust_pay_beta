import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/functions.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bill_splitter/select_bill_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bill_splitter/widgets.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

enum FormState {
  transactionEntry,
  contributorsSelection,
}

class CreateBillSplitterTransaction extends StatefulWidget {
  static const String routeName = '/create/bill_splitter';
  const CreateBillSplitterTransaction({super.key});

  @override
  State<CreateBillSplitterTransaction> createState() =>
      _CreateBillSplitterTransactionState();
}

class _CreateBillSplitterTransactionState
    extends State<CreateBillSplitterTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  //Form Variables
  DateTime? date = DateTime.now();
  // Bill splits pay Nigerian bills through Interswitch, so always NGN.
  final String currency = 'NGN';
  int splitType = 0;
  List<User> contributors = [];
  List<double> subAmounts = [];
  List<double> percentages = [];
  FormState state = FormState.transactionEntry;
  TransactionBill? bill;
  User? currentUser;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if(SplitType.values[splitType] != SplitType.splitManually){
      subAmounts = getSubAmounts(
        contributors.length, 
        splitType, 
        amountController,
        subAmounts
      );
      percentages = getPercentages(
        contributors.length, 
        splitType, 
        percentages
      );
    }
    
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          //Main Ui
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
                          Text("Create Bill Splitter", style: appTextBlack18Bold),
                        ],
                      ),
                      const SizedBox(height: AppSize.s16),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state == FormState.transactionEntry?
                              Column(
                                children: [
                                  AppTextInput(
                                      title: 'Transaction Title',
                                      type: TextInputType.text,
                                      hint: 'Team Bounding Dinner',
                                      controller: titleController),
                                  const SizedBox(height: AppSize.s16),
                                  AppTextInput(
                                      title: 'Bill Amount',
                                      type: TextInputType.number,
                                      hint: '0',
                                      currencySymbol: currencySymbolFor(currency),
                                      controller: amountController),
                                  const SizedBox(height: AppSize.s16),
                                  AppDateInput(
                                    title: 'Expiration Date',
                                    firstDate: earliestExpiryDate(),
                                    onDateSelected: (datetime) {
                                      setState(() {
                                        date = datetime;
                                      });
                                    },
                                  ),
                                ],
                              ): Container(),
                              state == FormState.contributorsSelection? TransactionDetails(
                                width: width,
                                date: date,
                                payeeName: bill!.billerName,
                                user: currentUser!,
                                splitType: splitType,
                                deleting: false,
                                editing: SplitType.values[splitType] == SplitType.splitManually || SplitType.values[splitType] == SplitType.splitByPercentage,
                                subAmounts: subAmounts,
                                percentages: percentages,
                                contributors: contributors,
                                currency: currency,
                                amountController: amountController,
                                titleController: titleController,
                                onSplitTypeSelected: (index) {
                                  setState(() {
                                    splitType = index;
                                  });
                                },
                                onUserSelected: (user) {
                                  if(user.id!=currentUser?.id) {
                                    setState(() {
                                      contributors.add(user);
                                      percentages.add(0);
                                    });
                                  }else {
                                    showSnackBar(context: context, message: 'Cannot select yourself');
                                  }
                                },
                                onDelete: (index) {
                                  setState(() {
                                    contributors.removeAt(index);
                                    percentages.removeAt(index);
                                  });
                                },
                                onChange: (value) {
                                  // print(subAmounts);
                                  // print(percentages);
                                },
                              ): Container()
                            ],
                          ),
                        ),
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
                    title: getButtonState(state),
                    onTap: () async {
                      if (state == FormState.transactionEntry) {
                        if (date != null && !isFutureExpiry(date)) {
                          showSnackBar(context: context, message: pastExpiryMessage);
                          return;
                        }
                        if (formValidation(date, amountController, titleController)) {
                          // Choose and check the bill the shares will pay.
                          SelectedBill? result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectBillView(
                              initialAmount: parseBillAmount(amountController.text),
                            ))
                          );
                          if (result != null) {
                            setState(() {
                              bill = result.bill;
                              // A fixed-price option sets the total.
                              amountController.text = result.amount % 1 == 0
                                  ? result.amount.toStringAsFixed(0)
                                  : result.amount.toStringAsFixed(2);
                              subAmounts = [];
                              state = FormState.contributorsSelection;
                            });
                          }
                        } else {
                          showSnackBar(context: context, message: "Enter the Transaction Title, the Amount and Date");
                        }
                      }
                      else {
                        if (state == FormState.contributorsSelection) {
                          if(SplitType.values[splitType] == SplitType.splitByPercentage){
                            for (var i = 0; i < subAmounts.length; i++) {
                              subAmounts[i] = double.parse(amountController.value.text)*percentages[i]/100;
                            }
                          }

                          //Create Obligations
                          List<Obligation> obligations = contributors.map((user) {
                            final index = contributors.indexOf(user);
                            return Obligation(
                              title: "bill splitting payment obligation",
                              status: currentUser?.id==user.id? ObligationStatus.verified: ObligationStatus.pending,
                              type: ObligationType.payment,
                              dueDate: date!,
                              amount: subAmounts[index],
                              binding: user.id
                            );
                          }).toList();

                          //Payout to the biller (paid through Interswitch, not to a member)
                          obligations.add(Obligation(
                              title: "Pay ${bill!.billerName}",
                              status: ObligationStatus.pending,
                              type: ObligationType.payout,
                              dueDate: date!,
                              amount: double.parse(amountController.value.text),
                          ));

                          //Create Transaction
                          Transaction transaction = Transaction(
                            userId: currentUser?.id,
                            title: titleController.text,
                            type: TransactionType.billSplitter,
                            currency: currency,
                            total: amountController.value.text.isEmpty?0: double.parse(amountController.value.text),
                            status: TransactionStatus.pending,
                            percentageComplete: 0,
                            members: contributors,
                            dateCreated: DateTime.now(),
                            expiryDate: date!,
                            obligations: obligations,
                            bill: bill,
                          );

                          if(transactionValidation(transaction)){
                            //Create Transaction
                            _createTransaction(context, transaction, transactionState);
                          }
                          else {
                            showSnackBar(context: context, message: 'Invalid transaction: Check that your total matches your sub totals and you have enough members');
                          }
                        }
                      }

                    }),
                )
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


String getButtonState(FormState state) {
  switch (state) {
    case FormState.transactionEntry:
      return 'Add Payee';
    case FormState.contributorsSelection:
      return 'Continue';
    default:
      return 'Continue';
  }
}

String getTitleState(FormState state) {
  switch (state) {
    case FormState.transactionEntry:
      return 'Transaction Information';
    case FormState.contributorsSelection:
      return 'Contributors';
    default:
      return 'Contributors';
  }
}
