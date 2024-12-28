import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class BiometricsButton extends StatelessWidget {
  final String? title;
  final Function() onTap;
  const BiometricsButton({super.key, this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s16, vertical: AppSize.s8),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColor.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.transparent),
            borderRadius: BorderRadius.circular(AppSize.s32),
          ),
          shadows: [boxShadowOne],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? 'Login with',
              style: appTextPrimary18Bold,
            ),
            const SizedBox(width: AppSize.s10),
            Icon(Icons.fingerprint, color: AppColor.primary),
          ],
        ),
      ),
    );
  }
}
