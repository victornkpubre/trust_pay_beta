import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class TransactionCardAddButton extends StatelessWidget {
  final Function() onClick;
  const TransactionCardAddButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 145,
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: ShapeDecoration(
          color: AppColor.lightPurple,
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
                color: AppColor.primary,
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


            Flexible(
              child: Text(
                'Add',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                  height: 1
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}