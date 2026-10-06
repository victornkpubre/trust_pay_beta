import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/tiles/source_of_truth_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';


class TransactionMediationView extends StatefulWidget {
  static const String routeName = '/transaction/mediation';
  const TransactionMediationView({
    super.key,
  });

  @override
  State<TransactionMediationView> createState() => _TransactionMediationViewState();
}

class _TransactionMediationViewState extends State<TransactionMediationView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<TransactionDetailsBloc, TransactionDetailsState>(
        listener: (context, transactionDetailsState) {
          if(transactionDetailsState.state==TransactionDetailsBlocStatus.transactionUpdated) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, transactionDetailsState) {
          Transaction? transaction = transactionDetailsState.transaction;

          return transaction == null?
          Container(
            color: AppColor.white,
            child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                )
            ),
          ): Stack(
            children: [
              Container(
                color: AppColor.white,
                padding: const EdgeInsets.symmetric(vertical: AppSize.s32, horizontal: AppSize.s16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [SizedBox(height: MediaQuery.of(context).viewPadding.top),

                        Stack(
                          children: [
                            const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSize.s4),
                                child: Row(
                                  children: [
                                    AppBackButton(size: AppSize.s16),
                                  ],
                                )),
                            Positioned.fill(
                                child: Center(
                                  child: Text('Mediation Verification',
                                      style: appTextBlack20Bold),
                                )),
                          ],
                        ),
                        const SizedBox(height: AppSize.s24),

                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: NoticeTile(
                            width: width,
                            richText:  Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Read ',
                                        style: TextStyle(
                                          color: AppColor.amber,
                                          fontSize: 18,
                                          fontFamily: 'Almarai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' the assertion below then state if it is true or false based on the source of truth',
                                        style: TextStyle(
                                          color: AppColor.amber,
                                          fontSize: 18,
                                          fontFamily: 'Almarai',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.s18),

                        SourceOfTruthTile(
                            details: transaction.mediation?.details??'',
                            url: transaction.mediation?.getUrl()??''
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        PrimaryButton(title: 'True', onTap: () {
                          final user = transaction.members.firstWhere((u) => u.id==transaction.mediation?.user_id);
                          final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payout&&o.binding==transaction.mediation?.user_id);
                          context.read<TransactionDetailsBloc>().add(
                              TransactionDetailsEvent.verifyTransactionObligation(
                                user, obligation, transaction, context, transactionDetailsState
                              )
                          );
                        }),
                        const SizedBox(height: AppSize.s16),

                        SecondaryButton(title: 'False', onTap: () {
                          final user = transaction.members.firstWhere((u) => u.id==transaction.mediation?.binding);
                          final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payout&&o.binding==transaction.mediation?.binding);
                          context.read<TransactionDetailsBloc>().add(
                              TransactionDetailsEvent.verifyTransactionObligation(
                                  user, obligation, transaction, context, transactionDetailsState
                              )
                          );
                        })
                      ],
                    )




                  ],
                ),
              ),

              //Loading Overlay
              BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
                  builder: (context, transactionDetailsState) {
                    return transactionDetailsState.state==TransactionDetailsBlocStatus.loading?
                    Container(
                      width: width,
                      color: Colors.black.withOpacity(0.25),
                      child: const Center(
                        child: AppCircleProgressIndicator(),
                      ),
                    ): Container();
                  }
              ),
            ],
          );
        },
      ),
    );
  }
}

// Obligation? getInitialPaymentObligation(Transaction transaction, User user) {
//   switch (transaction.type) {
//     case TransactionType.secureSales:
//       return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment);
//     case TransactionType.billSplitter:
//       return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment && o.binding==user.id);
//     case TransactionType.betsWagers:
//       return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment && o.binding==user.id);
//     case TransactionType.groupGoals:
//       return null;
//     case TransactionType.moneyPool:
//       final obligations = transaction.obligations.map((o) {
//         if(o.type==ObligationType.payment&&o.binding==user.id) {
//           return o;
//         }
//       }).toList();
//
//       return obligations.reduce((a, b) => a?.dueDate.isBefore(b?.dueDate??DateTime.now())??false ? a : b);
//     default:
//       return null;
//   }
// }
//
// double _getUserAmount(User user, Transaction transaction) {
//   switch (transaction.type) {
//     case TransactionType.secureSales:
//       return transaction.total;
//     case TransactionType.billSplitter:
//       return transaction.obligations.firstWhere((obligation) {
//         return obligation.binding!.compareTo(user.id!) == 0 &&
//             obligation.type == ObligationType.payment;
//       }).amount;
//     case TransactionType.betsWagers:
//       return transaction.total;
//     case TransactionType.groupGoals:
//       return transaction.obligations.firstWhere((obligation) {
//         return obligation.binding!.compareTo(user.id!) == 0 &&
//             obligation.type == ObligationType.payment;
//       }).amount;
//     case TransactionType.moneyPool:
//       return transaction.obligations.firstWhere((obligation) {
//         return obligation.binding!.compareTo(user.id!) == 0 &&
//             obligation.type == ObligationType.payment;
//       }).amount;
//     default:
//       return transaction.total;
//   }
// }
//
// buildPaymentDetails(double total, double fee) {
//   return Column(
//     children: [
//       const SizedBox(height: AppSize.s8),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Amount',
//             textAlign: TextAlign.center,
//             style: appTextGray16,
//           ),
//           Text(
//             parseAmountDouble(total),
//             textAlign: TextAlign.center,
//             style: appTextGray16,
//           ),
//         ],
//       ),
//       const SizedBox(height: AppSize.s10),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Service Fee:($fee%)',
//             textAlign: TextAlign.center,
//             style: appTextGray16,
//           ),
//           Text(
//             parseAmountDouble((total * 0.015)),
//             textAlign: TextAlign.center,
//             style: appTextGray16,
//           ),
//         ],
//       ),
//       const SizedBox(height: AppSize.s10),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Total Amount',
//             textAlign: TextAlign.center,
//             style: appTextGray16,
//           ),
//           Text(
//             parseAmountDouble(total + (total * 0.015).ceil()),
//             textAlign: TextAlign.center,
//             style: appTextAmber16,
//           ),
//         ],
//       ),
//       const SizedBox(height: AppSize.s16),
//     ],
//   );
// }
