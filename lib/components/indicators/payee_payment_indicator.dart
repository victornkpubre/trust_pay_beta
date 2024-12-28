import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class PayeePaymentIndicator extends StatelessWidget {
  final int paymentFulfilled;
  final int paymentsTotal;
  final double width;
  final String payee;
  final Color? color;
  const PayeePaymentIndicator(
      {super.key,
      required this.paymentFulfilled,
      required this.width,
      required this.paymentsTotal,
      required this.payee, 
      this.color});

  @override
  Widget build(BuildContext context) {
    final double percentageCompletion = paymentFulfilled / paymentsTotal;

    return Container(
      color: color?? AppColor.secondary,
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s8),
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payee',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: width/24,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                payee,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColor.fontGray,
                  fontSize: width/24,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$paymentFulfilled out of $paymentsTotal have been paid',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColor.fontGray,
                    fontSize: width/30,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      height: 6,
                      width: width,
                      decoration: ShapeDecoration(
                        color: AppColor.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 6,
                      width: width * percentageCompletion,
                      decoration: ShapeDecoration(
                        color: AppColor.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
