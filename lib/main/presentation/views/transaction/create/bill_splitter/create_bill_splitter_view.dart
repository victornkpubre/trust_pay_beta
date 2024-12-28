import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/base/user_search_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bill_splitter/widgets.dart';

enum FormState {
  transactionEntry,
  contributorsSelection,
}

enum SplitType { splitEvenly, splitByPercentage, splitManually }

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
  int splitType = 0;
  List<User> contributors = [users[0].copyWith()];
  List<double> subAmounts = [];
  List<double> percentages = [];
  FormState state = FormState.transactionEntry;
  User? payee;
  User user = users[0].copyWith();


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
          Container(
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
                      state == FormState.transactionEntry
                          ? Column(
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
                                    controller: amountController),
                                const SizedBox(height: AppSize.s16),
                                AppDateInput(
                                  title: 'Expiration Date',
                                  onDateSelected: (datetime) {
                                    setState(() {
                                      date = datetime;
                                    });
                                  },
                                ),
                              ],
                            )
                          : Container(),
                      state == FormState.contributorsSelection? TransactionDetails(
                        width: width,
                        date: date,
                        payee: payee!,
                        user: user,
                        splitType: splitType,
                        deleting: false,
                        editing: SplitType.values[splitType] == SplitType.splitManually || SplitType.values[splitType] == SplitType.splitByPercentage,
                        subAmounts: subAmounts,
                        percentages: percentages,
                        contributors: contributors,
                        amountController: amountController,
                        titleController: titleController, 
                        onSplitTypeSelected: (index) {
                          setState(() {
                            splitType = index;
                          });
                        }, 
                        onUserSelected: (user) {
                          setState(() {
                            contributors.add(user);
                            percentages.add(0);
                          });
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
          ),
          Positioned(
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
                        if (formValidation(
                            date, amountController, titleController)) {
                          User? result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserSearchView(nameOnly: true)));
                          if (result != null) {
                            
                            setState(() {
                              payee = result;
                              state = FormState.contributorsSelection;
                            });
                          }
                        } else {
                          toast(message: "Enter the Transaction Title, the Amount and Date");
                        }
                      } 
                      else {
                        if (state == FormState.contributorsSelection) {
                          
                          if(SplitType.values[splitType] == SplitType.splitByPercentage){
                            for (var i = 0; i < subAmounts.length; i++) {
                              subAmounts[i] = double.parse(amountController.value.text)*percentages[i]/100;
                            }
                          }
                          print("subAmounts");
                          print(subAmounts);

                          //Create Obligations
                          List<Obligation> obligations = subAmounts.map((amount) {
                            return Obligation(
                              title: "bill spliting payment obligation", 
                              status: ObligationStatus.pending, 
                              type: ObligationType.payment, 
                              dueDate: date!, 
                              amount: amount
                            );
                          }).toList();

                          //Create Transaction
                          Transaction transaction = Transaction(
                            title: titleController.text, 
                            type: TransactionType.billSplitter, 
                            total: amountController.value.text.isEmpty?0: double.parse(amountController.value.text), 
                            status: TransactionStatus.pending, 
                            percentageComplete: 0, 
                            members: contributors, 
                            dateCreated: DateTime.now(), 
                            expiryDate: date!, 
                            obligations: obligations 
                          );
                          
                          if(transactionValidation(transaction)){
                            toast(message: "sucessfull", color: AppColor.greenSecondary);
                            //Navigate to Transaction Details View
                          }
                          else {
                            toast(message: 'Invalid transaction: Check that your total matches your sub totals and you have enough members');
                          }
                        }
                      }

                    }),
              )),
        ],
      ),
    );
  }
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
