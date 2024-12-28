import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSecondaryTextInput extends StatelessWidget {
  final double width;
  final String hint;
  final TextInputType? type;
  final TextEditingController controller;

  const AppSecondaryTextInput(
      {super.key,
      required this.hint,
      this.type,
      required this.controller,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s16, vertical: AppSize.s8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              shadows: [boxShadowOne],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                type == TextInputType.number
                    ? Row(
                        children: [
                          Text(AppString.naira, style: appTextGray16),
                          const SizedBox(width: AppSize.s4),
                        ],
                      )
                    : Container(),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: type == TextInputType.number
                        ? const TextInputType.numberWithOptions(decimal: true)
                        : type ?? TextInputType.text,
                    inputFormatters: type == TextInputType.number
                        ? <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ]
                        : null,
                    style: appTextGray16,
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: AppSize.s8),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
