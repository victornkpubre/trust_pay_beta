import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/indicators/payee_payment_indicator.dart';
import 'package:trust_pay_beta/components/list_iems/user_profile_status_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';
import '../transaction_preview_section.dart';


BillSplitterPreview({required double width, required TransactionDetailsViewState state, required Transaction transaction, required User currentUser, required List<UserInput> users}) {
  User binding = transaction.members.firstWhere((t) => t.id == transaction.userId);

  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      state == TransactionDetailsViewState.payment?  Column(
        children: [
          PayeePaymentIndicator(
            width: width,
            paymentFulfilled: getPercentageOfBillPaid(transaction).toInt(),
            paymentsTotal: 100,
            payee: transaction.payee?.businessName??'Select a Payee',
          ),
          const SizedBox(height: AppSize.s16),
        ],
      ): Container(),

      Align(
          alignment: Alignment.centerLeft,
          child: Text(state == TransactionDetailsViewState.payment? 'Your Contribution': 'Contribution')
      ),
      Container(
        color: AppColor.secondary,
        padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
        width: double.infinity,
        child: Center(
          child: Text(
            parseAmountDouble(getUserObligationAmount(currentUser, transaction.obligations)??0.00),
            style: appTextBlack32Bold,
          ),
        ),
      ),
      const SizedBox(height: AppSize.s4),
      Align(
          alignment: Alignment.centerLeft,
          child: state != TransactionDetailsViewState.payment?
          Text('Contributors: ${users.length}'): Container()
      ),
      state != TransactionDetailsViewState.payment?
      Divider(thickness: 1, color: AppColor.lightGray, height: 0):
      Container(),
      state != TransactionDetailsViewState.payment? Expanded(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: transaction.obligations.map((obligation) =>
                obligation.binding == null? Container():
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                        thickness: 1,
                        color: AppColor.lightGray,
                        height: 0
                    ),
                    const SizedBox(height: AppSize.s8),
                    UserProfileStatusListItem(
                      user: binding.toUserInput(),
                      amount: obligation.amount,
                      obligationStatus: obligation.status,
                      textColor: AppColor.darkGray,
                      onDelete: () {},
                    ),
                    const SizedBox(height: AppSize.s8),
                  ],
                )).toList()),
          )
      ): Container()
    ],
  );
}

