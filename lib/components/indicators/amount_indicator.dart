import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AmountIndicator extends StatelessWidget {
  final double amount;
  final double width;
  final double percentageComplete;
  const AmountIndicator({super.key, required this.amount, required this.width, required this.percentageComplete});

  @override
  Widget build(BuildContext context) {
    print("Percentage complete"+percentageComplete.toString());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: AppColor.secondary,
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Padding(
               padding: const EdgeInsets.only(top: AppSize.s16, bottom: AppSize.s8),
              child: Text(
                parseAmountDouble(amount),
                style: appTextBlack32Bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: [
                  Container(
                    height: 6,
                    width: width,
                    decoration: ShapeDecoration(
                      color: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                    ),
                  ),
                  Container(
                    height: 6,
                    width: width * percentageComplete,
                    decoration: ShapeDecoration(
                      color: AppColor.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}