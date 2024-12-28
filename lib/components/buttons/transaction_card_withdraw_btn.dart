import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class TransactionAddButton extends StatelessWidget {
  const TransactionAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF3E0),
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
            FontAwesomeIcons.solidPaperPlane, 
            size: 16,
            color: AppColor.amber,
          ),
          const SizedBox(width: 16),

          Text(
            'Withdraw',
            style: TextStyle(
              color: AppColor.amber,
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