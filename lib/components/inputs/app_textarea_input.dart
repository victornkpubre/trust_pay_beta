import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppTextAreaInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const AppTextAreaInput(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s8, vertical: AppSize.s8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              shadows: [boxShadowOne],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: appTextGray16,
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: AppSize.s8,
          bottom: AppSize.s8,
          child: Image.asset(ImageAssets.text_area_icon,
              width: AppSize.s8, height: AppSize.s8),
        ),
      ],
    );
  }
}
