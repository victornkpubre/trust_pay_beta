import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class PayeeTile extends StatelessWidget {
  final String payee;
  final double amount;
  final DateTime date;
  final String title; 
  const PayeeTile({super.key, required this.payee, required this.amount, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(AppSize.s8)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: appTextBlack20Bold.copyWith(height: 1),
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(height: AppSize.s8),
                          Text('Created: ${parseDate(date)}', style: appTextGray16),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSize.s16),
                    Text(parseAmountDouble(amount), style: appTextGray18)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s8),
          Row(
            children: [
              Text('Payee: ', style: appTextGray18),
              Text(
                payee,
                style: appTextPurple18Bold,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s16),
      ],
    );
  }
}