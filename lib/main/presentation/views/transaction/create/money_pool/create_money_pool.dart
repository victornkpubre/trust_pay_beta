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
import 'package:trust_pay_beta/main/presentation/views/transaction/create/money_pool/widget.dart';

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
  final TextEditingController durationController = TextEditingController();

  //Form Variables
  DateTime? date;
  List<User> contributors = [users[0].copyWith()];
  FormState state = FormState.transactionEntry;
  User user = users[0].copyWith();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
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
                      AppTextInput(
                          title: 'Amount (Monthly Payout)',
                          type: TextInputType.number,
                          hint: '0',
                          controller: amountController),
                      const SizedBox(height: AppSize.s16),
                      AppTextInput(
                          title: 'Duration (in Months)',
                          type: TextInputType.number,
                          withNairaSign: false,
                          hint: '0',
                          controller: durationController),
                      const SizedBox(height: AppSize.s16),
                      AppDateInput(
                        title: 'Start Date',
                        onDateSelected: (datetime) {
                          setState(() {
                            date = datetime;
                          });
                        },
                      ),
                    ],
                  ):
                  AddContributorsWidget(
                    width: width,
                    title: titleController.value.text,
                    user: user,
                    amount: double.parse(amountController.value.text),
                    date: date!,
                    contributors: contributors,
                    onAddContributor: (user) {
                      setState(() {
                        contributors.add(user);
                      });
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
          ),

          Positioned(
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
                    }

                    if(state == FormState.contributorsSelection){
                      //Create Transaction
                      Transaction transaction = Transaction(
                        title: titleController.text, 
                        type: TransactionType.moneyPool, 
                        total: amountController.value.text.isEmpty?0: double.parse(amountController.value.text), 
                        status: TransactionStatus.pending, 
                        percentageComplete: 0, 
                        members: contributors, 
                        dateCreated: DateTime.now(), 
                        expiryDate: date!, 
                        obligations: generateObligation(
                          contributors, 
                          double.parse(amountController.value.text), 
                          int.parse(durationController.value.text), 
                          date!
                        ) 
                      );

                      print(transaction.obligations.length);
                    }

                  }
                ),
              )),
        ],
      ),
    );
  }

  List<Obligation> generateObligation(List<User> contributors, double amount, int durationMonths, DateTime startDate) {
    double payment = amount/contributors.length;
    List<Obligation> obligations = [];

    for (var i = 0; i < durationMonths; i++) {
      for (var contributor in contributors) {
        obligations.add(Obligation(
          title: 'money pool payment', 
          status: ObligationStatus.pending, 
          type: ObligationType.payment, 
          binding: contributor.id, 
          dueDate: DateTime(startDate.year, startDate.month+i, startDate.day), 
          amount: payment
        ));
      }

      obligations.add(Obligation(
        title: 'money pool payout', 
        status: ObligationStatus.pending, 
        type: ObligationType.payout, 
        binding: contributors[i%contributors.length].id, 
        dueDate: DateTime(startDate.year, startDate.month+i, startDate.day), 
        amount: amount
      ));
    }

    return obligations;
  }


  bool validate() {
    bool entryValidated = titleController.value.text.isNotEmpty &&
      amountController.value.text.isNotEmpty &&
      date != null;
    bool durationMatchesContributors = int.parse(durationController.value.text)%contributors.length == 0;

    if(!entryValidated) {
      toast(message: 'Please fill all fields');
    }
    if(!durationMatchesContributors) {
      toast(message: 'The duration must be a multiple of the Number of contributors');
    }


    return entryValidated && durationMatchesContributors;
  }
}