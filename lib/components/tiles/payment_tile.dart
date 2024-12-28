
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class PaymentTile extends StatelessWidget {
  final Transaction transaction;
  final double amount;
  const PaymentTile({super.key, required this.transaction, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment', style: appTextGray16Bold),
          const SizedBox(height: AppSize.s4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Start: ${parseDateMonthYear(transaction.dateCreated)}', style: appTextGray16),
              Text('End: ${parseDateMonthYear(transaction.expiryDate)}', style: appTextGray16),
            ],
          ),
          const SizedBox(height: AppSize.s4),
          Container(
            color: AppColor.secondary,
            padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Text(
                    parseAmountDouble(amount),
                    style: appTextBlack32Bold,
                  ),
                  Text('Per Month', style: appTextGray16)
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

