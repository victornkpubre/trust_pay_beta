import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class AppBackButton extends StatelessWidget {
  final double size;
  final Function()? onTap;
  const AppBackButton({super.key, required this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Container(
          padding: const EdgeInsets.all(4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColor.lightGray,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColor.lightGray),
              borderRadius: BorderRadius.circular(64),
            ),
            shadows: [boxShadowOne],
          ),
          child: Icon(
            FontAwesomeIcons.angleLeft,
            color: AppColor.fontGray,
            size: size,
          )),
    );
  }
}
