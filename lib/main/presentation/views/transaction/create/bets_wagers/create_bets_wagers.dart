import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bets_wagers/widgets.dart';

enum FormState {
  transactionEntry,
  sourceOfTruth,
}

class CreateBetWagerTransaction extends StatefulWidget {
  static const String routeName = '/create/bet_wager';
  const CreateBetWagerTransaction({super.key});

  @override
  State<CreateBetWagerTransaction> createState() =>
      _CreateBetWagerTransactionState();
}

class _CreateBetWagerTransactionState
    extends State<CreateBetWagerTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController assertionController = TextEditingController();

  //Form Variables
  DateTime? date;
  List<User> contributors = [users[0].copyWith()];
  FormState state = FormState.transactionEntry;
  User? binding;
  User user = users[0].copyWith();
  Source? source;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
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
                  Text("Create Trust Wager", style: appTextBlack18Bold),
                ],
              ),
              const SizedBox(height: AppSize.s32),
              Expanded(
                child: Column(
                  children: [
                    state == FormState.transactionEntry?
                    TransactionDetailsForm(
                      titleController: titleController, 
                      assertionController: assertionController, 
                      amountController: amountController, 
                      binding: binding, 
                      onDateSelected: (dateTime) {
                        setState(() {
                          date = dateTime;
                        });
                      },
                      onUserSelected: (user) {
                        setState(() {
                          binding = user;
                        });
                      },
                    ):
                    SourceOfTruthWidget(
                      onSelection: (source) {
                        source = source;
                        print(source?.url);
                      },
                    ),
                    const SizedBox(height: 32),
                  ] 
                ),
              )
            ]),
          ),
          Positioned(
              bottom: AppSize.s64,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: PrimaryButton(
                    width: double.infinity,
                    title: "Continue",
                    onTap: () async {
                      if(state == FormState.transactionEntry) {
                        if(validateDetails()){
                          setState(() {
                            state = FormState.sourceOfTruth;
                          });
                        }
                        else {
                          toast(message: 'Enter all fields');
                        }
                      }

                      if(state == FormState.sourceOfTruth) {
                        if(source != null) {
                          Transaction transaction = Transaction(
                            title: titleController.value.text,
                            type: TransactionType.betsWagers,
                            total: double.parse(amountController.value.text),
                            dateCreated: DateTime.now(),
                            expiryDate: date!,
                            percentageComplete: 0,
                            status: TransactionStatus.pending,
                            obligations: [],
                            members: [user, binding!],
                            mediation: getMediation()
                          );

                          //Create Transaction
                          print(transaction);
                          createTransaction(context, transaction);
                        } 
                      }
                    }),
              )),
        ],
      ),
    );
  }

  Mediation getMediation() {
    return Mediation(
      mediator: 2,
      binding: 1,
      user: 4,
      sourceType: source!.type.toString(),
      details: assertionController.value.text,
      web: source!.type == SourceType.website?
        source!.url: null,
      image: source!.type == SourceType.image?
        source!.url: null,
      video: source!.type == SourceType.video?
        source!.url: null,
    );
  }

  bool validateDetails() {
    return titleController.value.text.isNotEmpty &&
      assertionController.value.text.isNotEmpty &&
      amountController.value.text.isNotEmpty &&
      date != null &&
      binding != null;

  }
}

void createTransaction(BuildContext context, Transaction transaction) {
  // context.read<TransactionBloc>().add(TransactionEvent.createTransaction(transaction));
}
