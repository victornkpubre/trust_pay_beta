import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/functions.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bets_wagers/widgets.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

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

class _CreateBetWagerTransactionState extends State<CreateBetWagerTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController assertionController = TextEditingController();

  //Form Variables
  DateTime? date;
  String currency = 'NGN';
  List<User> contributors = [users[0].copyWith()];
  FormState state = FormState.transactionEntry;
  User? binding;
  User? currentUser;
  User? mediator;
  Source? source;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //Main Ui
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
                        if(user.id!=currentUser?.id) {
                          setState(() {
                            binding = user;
                          });
                        }else {
                          showSnackBar(context: context, message: 'Cannot select yourself');
                        }
                      },
                      currency: currency,
                      onCurrencySelected: (selected) {
                        setState(() {
                          currency = selected;
                        });
                      },
                    ):
                    SourceOfTruthWidget(
                      onSelection: (result) {
                        source = result;
                      },
                    ),
                    const SizedBox(height: 32),
                  ] 
                ),
              )
            ]),
          ),

          //Main Button
          BlocConsumer<TransactionBloc, TransactionBlocState>(
            listener: (context, transactionState) {
              if( transactionState.status == TransactionBlocStatus.transactionCreated ) {
                //Notify Members
                initialNotification(context, transactionState.transaction!, transactionState);
              }

              if(transactionState.status == TransactionBlocStatus.transactionUpdated) {
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
                  mediator = userState.mediator;

                  if(currentUser == null) {
                    context.read<UserBloc>().add(UserEvent.currentUser(userState));
                  }

                  if(mediator == null) {
                    if(currentUser!=null && binding!=null){
                      context.read<UserBloc>().add(UserEvent.getMediator(userState, currentUser!, binding!));
                    }
                  }

                  return Positioned(
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
                            if(validateDetails()) {
                              setState(() {
                                state = FormState.sourceOfTruth;
                              });
                            }
                            else {
                              showSnackBar(context: context, message: 'Enter all fields');
                            }
                          }

                          if(state == FormState.sourceOfTruth) {
                            if(source != null) {
                              final amount = double.parse(amountController.value.text);
                              final dueDate = DateTime.now();

                              if(mediator?.id == currentUser?.id) {
                                showSnackBar(context: context, message: 'No Mediators Available At the Moment');
                              }
                              else {
                                Transaction transaction = Transaction(
                                    userId: currentUser?.id??-1,
                                    title: titleController.value.text,
                                    type: TransactionType.betsWagers,
                                    currency: currency,
                                    total: amount,
                                    dateCreated: dueDate,
                                    expiryDate: date!,
                                    percentageComplete: 0,
                                    status: TransactionStatus.pending,
                                    obligations: getObligations(dueDate, amount, currentUser!, binding!, mediator!),
                                    members: [currentUser!, binding!, mediator!],
                                    mediation: getMediation(currentUser!.id!, binding!.id!, mediator!.id!)
                                );

                                //Create Transaction
                                _createTransaction(context, transaction, transactionState, source!.data);
                              }
                            }
                          }
                        }
                      ),
                    )
                  );
                }
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

  void _createTransaction(BuildContext context, Transaction transaction, TransactionBlocState state, File? source) {
    context.read<TransactionBloc>().add(TransactionEvent.createTransaction(transaction, state, source));
  }

  Mediation getMediation(int user, int binding, int mediator) {
    return Mediation(
      mediator: mediator,
      binding: binding,
      user_id: user,
      source_type: source!.type.toString(),
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

List<Obligation> getObligations(DateTime dateCreated, double total, User user, User binding, User mediator) {
  List<Obligation> obligations = [];
  obligations.addAll([
    Obligation(
      title: 'bets and wager - payment',
      status: ObligationStatus.pending,
      type: ObligationType.payment,
      dueDate: dateCreated,
      amount: total,
      binding: user.id
    ),
    Obligation(
      title: 'bets and wager - payment',
      status: ObligationStatus.pending,
      type: ObligationType.payment,
      dueDate: dateCreated,
      amount: total,
      binding: binding.id
    ),
    Obligation(
      title: 'bets and wager - payout',
      status: ObligationStatus.pending,
      type: ObligationType.payout,
      dueDate: dateCreated,
      amount: total,
      binding: user.id
    ),
    Obligation(
      title: 'bets and wager - payout',
      status: ObligationStatus.pending,
      type: ObligationType.payout,
      dueDate: dateCreated,
      amount: total,
      binding: binding.id
    ),
  ]);

  return obligations;
}
