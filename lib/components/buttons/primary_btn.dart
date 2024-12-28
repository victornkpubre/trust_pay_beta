import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool? active;
  final IconData? icon;
  final Function() onTap;
  final double? width;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.active = true,
      this.icon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s16, vertical: AppSize.s8),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: active! ? AppColor.primary : AppColor.lightGray,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.borderGray),
            borderRadius: BorderRadius.circular(AppSize.s32),
          ),
          shadows: [boxShadowOne],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon, color: AppColor.white) : Container(),
            icon != null ? const SizedBox(width: AppSize.s10) : Container(),
            Text(
              title,
              style: appTextWhite18Bold,
            ),
          ],
        ),
      ),
    );
  }
}
