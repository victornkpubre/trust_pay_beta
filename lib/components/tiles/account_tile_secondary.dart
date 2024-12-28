import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class AccountTileSecondary extends StatelessWidget {
  final String accountNumber;
  const AccountTileSecondary({super.key, required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s16, vertical: AppSize.s8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColor.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: [boxShadowOne],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '#$accountNumber',
            style: TextStyle(
              color: AppColor.amber,
              fontSize: 14,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            FontAwesomeIcons.solidCopy,
            color: AppColor.amber,
            size: 16,
          )
        ],
      ),
    );
  }
}
