import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class TransactionCardRejectButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  const TransactionCardRejectButton({super.key, this.onTap, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width*0.07, vertical: width*0.035),
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
              size: width*0.03,
            ),
            const SizedBox(width: 16),

            Text(
              'Decline',
              style: TextStyle(
                color: AppColor.red,
                fontSize: width*0.035,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w600,
                height: 1
              ),
            ),
          ],
        ),
      ),
    );
  }
}