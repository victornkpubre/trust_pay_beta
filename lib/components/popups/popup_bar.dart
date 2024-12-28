import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class PopUpBar extends StatelessWidget {
  const PopUpBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.lightGray
      ),
    );
  }
}