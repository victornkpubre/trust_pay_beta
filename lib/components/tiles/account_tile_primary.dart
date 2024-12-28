import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class AccountTilePrimary extends StatelessWidget {
  final String number;
  final double width;
  const AccountTilePrimary(
      {super.key, required this.number, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s16, vertical: AppSize.s8),
      decoration: ShapeDecoration(
        color: AppColor.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [boxShadowOne],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Number",
            style: TextStyle(
                color: AppColor.gray,
                fontSize: FontSize.s16,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(
                  color: AppColor.fontGray,
                  fontSize: FontSize.s16,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidCopy,
                color: AppColor.primary,
                size: AppSize.s20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
