import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSearchInput extends StatelessWidget {
  final String hint; 
  final TextEditingController controller;
  final Color? borderColor;
  final Function(String)? onChange;

  const AppSearchInput(
      {super.key, required this.hint, required this.controller, this.borderColor, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s8, vertical: AppSize.s8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: borderColor?? AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s32),
              ),
              shadows: [boxShadowOne],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgIconAssets.search_icon_secondary,
                  height: AppSize.s20,
                  width: AppSize.s20,
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    style: appTextGray16,
                    decoration: const InputDecoration(
                      // hintText: hint,
                      border: InputBorder.none,
                      // contentPadding:
                      //     const EdgeInsets.symmetric(vertical: AppSize.s4),
                      isDense: true,
                    ),
                    onChanged: onChange,
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
