import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/indicators/payee_payment_indicator.dart';
import 'package:trust_pay_beta/components/indicators/payee_user_indicator.dart';
import 'package:trust_pay_beta/components/list_iems/user_profile_status_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/payment_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';
import '../transaction_preview_section.dart';


GroupGoalPreview({
  required double width,
  required Transaction transaction,
  required User currentUser,
  required TransactionDetailsViewState state,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: AppSize.s16),
      PayeePaymentIndicator(
        width: width,
        paymentFulfilled: getPercentageOfBillPaid(transaction).toInt(),
        paymentsTotal: 100,
        payee: transaction.payee?.businessName??'Select a Payee',
      ),

      const SizedBox(height: AppSize.s16),
      state == TransactionDetailsViewState.payment?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Group Members', style: appTextGray16Bold),
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

      const SizedBox(height: AppSize.s16),
      PaymentTile(
          transaction: transaction,
          amount: getUserObligationAmount(currentUser, transaction.obligations)??0.00
      ),
      const SizedBox(height: AppSize.s16),

      state == TransactionDetailsViewState.acceptance? Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: transaction.obligations.length,
            itemBuilder: (context, index) {
              Obligation obligation = transaction.obligations[index];
              User createdBy = transaction.members.firstWhere((t) => t.id == transaction.userId);

              return obligation.type != ObligationType.payment? Container(): Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserProfileStatusListItem(
                      user: createdBy.toUserInput(),
                      textColor: AppColor.fontBlack,
                      amount: obligation.amount,
                      obligationStatus: obligation.status
                  ),
                  const SizedBox(height: AppSize.s16),
                ],
              );
            }),
      ): Container()
    ],
  );
}