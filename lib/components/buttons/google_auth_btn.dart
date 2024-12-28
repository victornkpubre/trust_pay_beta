import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class GoogleAuthButton extends StatelessWidget {
  final String? title;
  final Function() onTap;
  const GoogleAuthButton({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s16, vertical: AppSize.s10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColor.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.borderGray),
            borderRadius: BorderRadius.circular(AppSize.s32),
          ),
          shadows: [boxShadowOne],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              IconAssets.googleIcon,
              width: AppSize.s24,
              height: AppSize.s24,
            ),
            const SizedBox(width: AppSize.s10),
            Text(
              title??AppString.googleLogin,
              style: appTextPrimary18Bold,
            ),
          ],
        ),
      ),
    );
  }
}
