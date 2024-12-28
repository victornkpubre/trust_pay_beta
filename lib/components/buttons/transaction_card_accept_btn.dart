import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class TransactionCardAcceptButton extends StatelessWidget {
  const TransactionCardAcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 48,
      decoration: ShapeDecoration(
        color: AppColor.lightGreen,
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
          Container(
            height: 24,
            width: 24,
            decoration: ShapeDecoration(
              color: AppColor.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              color: AppColor.white,
              size: 12,
            )
          ),
          const SizedBox(width: 16),


          Text(
            'Accept',
            style: TextStyle(
              color: AppColor.green,
              fontSize: 16,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w600,
              height: 1
            ),
          ),
        ],
      ),
    );
  }
}