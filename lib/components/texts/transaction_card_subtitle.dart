import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class TransactionCardSubtitle extends StatelessWidget {
  final double fontSize;
  final String text1;
  final String text2;
  final String? text3;
  const TransactionCardSubtitle(
      {super.key,
      required this.text1,
      required this.text2,
      this.text3,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(style: TextStyle(fontSize: fontSize), children: [
      TextSpan(text: text1, style: TextStyle(color: AppColor.white)),
      TextSpan(text: text2, style: TextStyle(color: AppColor.amber)),
      text3 == null
          ? const TextSpan()
          : TextSpan(text: text3, style: TextStyle(color: AppColor.white)),
    ]));
  }
}
