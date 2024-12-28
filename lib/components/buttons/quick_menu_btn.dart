import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class QuickMenuButton extends StatelessWidget {
  final TransactionType type;
  final double size;
  final Color color;
  final Function() onTap;
  const QuickMenuButton(
      {super.key,
      required this.type,
      required this.size,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.white),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              getIcon(type),
              height: size * 1 / 2,
              width: size * 1 / 2,
            ),
            const SizedBox(height: AppSize.s4),
            Text(getTitle(type),
                textAlign: TextAlign.center, style: appTextBlack10),
          ],
        ),
      ),
    );
  }
}
