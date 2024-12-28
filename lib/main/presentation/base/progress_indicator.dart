import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class AppCircleProgressIndicator extends StatelessWidget {
  const AppCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Center(
          child: CircularProgressIndicator(
        color: AppColor.primary,
      )),
    );
  }
}
