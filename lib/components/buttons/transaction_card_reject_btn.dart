import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class TransactionCardRejectButton extends StatelessWidget {
  const TransactionCardRejectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 48,
      decoration: ShapeDecoration(
        color: AppColor.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: [
          boxShadowOne
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.xmark,
            color: AppColor.red,
            size: 14,
          ),
          const SizedBox(width: 16),


          Text(
            'Decline',
            style: TextStyle(
              color: AppColor.red,
              fontSize: 18,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w500,
              height: 1
            ),
          ),
        ],
      ),
    );
  }
}