import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AddButtton extends StatelessWidget {
  final String title;
  final bool solid;
  final Function() onTap;
  const AddButtton(
      {super.key,
      required this.title,
      required this.solid,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s24, vertical: AppSize.s14),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColor.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s32),
          ),
          shadows: [boxShadowOne],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(AppSize.s4),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: solid ? AppColor.primary : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s16),
                  ),
                ),
                child: Icon(
                  solid ? FontAwesomeIcons.plus : Icons.add,
                  color: solid ? AppColor.white : AppColor.primary,
                  size: solid ? FontSize.s10 : FontSize.s18,
                )),
            const SizedBox(width: AppSize.s8),
            Text(title, style: appTextPurple14Bold),
          ],
        ),
      ),
    );
  }
}
