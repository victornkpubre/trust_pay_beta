import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/indicators/payee_user_indicator.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/payment_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';
import '../transaction_preview_section.dart';


MoneyPoolPreview({required double width, required Transaction transaction, required User currentUser, required TransactionDetailsViewState state, required List<bool> payoutVisibility, required Function(int) onVisibilityToggle}) {
  List<Obligation> payoutObligations = transaction.obligations.where((o){
    if(o.type==ObligationType.payout) {
      return true;
    }
    else {
      return false;
    }
  }).toList();


  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: AppSize.s16),
      state == TransactionDetailsViewState.acceptance? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Members', style: appTextGray16Bold),
          const SizedBox(height: AppSize.s8),
          PayeeUserIndicator(
              date: transaction.expiryDate,
              group: true,
              amount: transaction.total,
              percentageCompletion: transaction.percentageComplete/100,
              width: width,
              users: transaction.members.map((m) => m.toUserInput()).toList()
          ),
        ],
      ): Container(),
      state == TransactionDetailsViewState.payment? Column(
        children: [
          PaymentTile(
              transaction: transaction,
              amount: getUserObligationAmount(currentUser, transaction.obligations)??0.00),
        ],
      ): Container(),
      state == TransactionDetailsViewState.payment?
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s16),
            Text('Payout Details', style: appTextGray16Bold),
            const SizedBox(height: 8),

            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                            children: payoutObligations.map((o) {
                              int index = payoutObligations.indexOf(o);
                              User binding = transaction.members.firstWhere((t) => t.id == o.binding);

                              return InkWell(
                                  onTap: () {
                                    onVisibilityToggle(index);
                                  },
                                  child: Column(
                                    children: [
                                      Divider(height: 1, thickness: 2, color: AppColor.lightGray),
                                      buildPayoutTile(o, payoutVisibility[index], binding),
                                    ],
                                  )
                              );
                            }).toList()
                        ),
                        Divider(height: 0, thickness: 2, color: AppColor.lightGray),
                      ],
                    )
                )
            )
          ],
        ),
      ):
      Expanded(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s16),
              PaymentTile(
                  transaction: transaction,
                  amount: getUserObligationAmount(currentUser, transaction.obligations)??0.00
              ),
              const SizedBox(height: AppSize.s16),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Payout Details', style: appTextGray16Bold)
              ),
              const SizedBox(height: 8),

              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                              children: payoutObligations.map((o) {
                                int index = payoutObligations.indexOf(o);
                                User binding = transaction.members.firstWhere((t) => t.id == o.binding);

                                return InkWell(
                                    onTap: () {
                                      onVisibilityToggle(index);
                                    },
                                    child: Column(
                                      children: [
                                        Divider(height: 1, thickness: 2, color: AppColor.lightGray),
                                        buildPayoutTile(o, payoutVisibility[index], binding),
                                      ],
                                    )
                                );
                              }).toList()
                          ),
                          Divider(height: 0, thickness: 2, color: AppColor.lightGray),
                        ],
                      )
                  )
              )
            ],
          )
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: transaction.members.length,
        //   itemBuilder: (context, index) {
        //     return transaction.obligations[index].binding == null ? Container():
        //     Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Row(
        //           children: [
        //             Container(
        //               color: Colors.amber,
        //               padding: const EdgeInsets.symmetric(
        //                 vertical: AppSize.s16, horizontal: 2
        //               ),
        //             ),
        //             const SizedBox(width: 2),
        //             Text((index + 1).toString()),
        //             const SizedBox(width: AppSize.s8),
        //             Expanded(
        //               child: UserProfileStatusListItem(
        //                   user: transaction.obligations[index].binding!.toUserInput(),
        //                   textColor: AppColor.darkGray,
        //                   amount: transaction.obligations[index].amount,
        //               ),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(height: AppSize.s16),
        //       ],
        //     );
        //   }),
      )
    ],
  );
}