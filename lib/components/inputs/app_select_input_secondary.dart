

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSecondarySelectInput extends StatefulWidget {
  final String hint;
  const AppSecondarySelectInput({super.key, required this.hint});

  @override
  State<AppSecondarySelectInput> createState() => _AppSecondarySelectInputState();
}

class _AppSecondarySelectInputState extends State<AppSecondarySelectInput> {
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
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColor.lightGray,
              shape: RoundedRectangleBorder (
                side: BorderSide(width: 1, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s16),
              ),
              shadows: [
                boxShadowOne
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                      widget.hint,
                      style: appTextGray16
                  ),
                ),

                const Icon(FontAwesomeIcons.angleDown)
              ],
            ),
          ),


        ],
      ),
    );
  }
}
