import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class StatusText extends StatelessWidget {
  final TransactionStatus status;
  final double fontSize;
  const StatusText({super.key, required this.status, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: AppSize.s8,
          width: AppSize.s8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getStatsColor(status),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          getStatsTitle(status),
          style: TextStyle(
            color: getStatsColor(status),
            fontSize: fontSize,
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
