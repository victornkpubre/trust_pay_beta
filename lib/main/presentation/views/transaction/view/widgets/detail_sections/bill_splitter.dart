import 'package:flutter/material.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/indicators/payee_payment_indicator.dart';
import '../../../../../../../components/list_iems/user_profile_status_list_item.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../domain/entities/base/entities.dart';
import '../../../../../../domain/entities/transaction/entities.dart';
import '../../../../../../domain/entities/user/entities.dart';


Widget BillSplitterDetails(
    {required double width,
      required User? payee,
      required percentageCompletion,
      required Transaction transaction}) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      PayeePaymentIndicator(
          paymentFulfilled: percentageCompletion,
          width: width,
          paymentsTotal: transaction.obligations.length,
          payee: payee?.businessName ?? 'Select a Payee'),
      const SizedBox(height: AppSize.s16),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Contributors: ${transaction.members.length}')),
      Divider(thickness: 1, color: AppColor.lightGray, height: 0),
      Expanded(
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: transaction.members
                    .map((user) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                        thickness: 1,
                        color: AppColor.lightGray,
                        height: 0),
                    const SizedBox(height: AppSize.s8),
                    UserProfileStatusListItem(
                      user: user.toUserInput(),
                      amount: 10000.00,
                      transactionStatus: TransactionStatus.accepted,
                      textColor: AppColor.darkGray,
                      onDelete: () {},
                    ),
                    const SizedBox(height: AppSize.s8),
                  ],
                ))
                    .toList())),
      ),
    ],
  );
}