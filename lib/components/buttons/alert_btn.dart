import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AlertButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const AlertButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s16, vertical: AppSize.s14),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColor.redAccent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.borderGray),
            borderRadius: BorderRadius.circular(AppSize.s32),
          ),
          shadows: [boxShadowOne],
        ),
        child: Center(
          child: Text(title, style: appTextRed18),
        ),
      ),
    );
  }
}