import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppTextInput extends StatefulWidget {
  final String? title;
  final TextInputType type;
  final String hint;
  final bool withNairaSign;
  final TextEditingController controller;

  const AppTextInput(
    {super.key,
    this.title,
    required this.type,
    required this.hint,
    required this.controller, 
    this.withNairaSign = true
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Text(widget.title!, style: appTextPrimary16Bold)
              : Container(),
          widget.title != null ? const SizedBox(height: 6) : Container(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s16, vertical: AppSize.s10),
            decoration: ShapeDecoration(
              color: widget.type != TextInputType.visiblePassword
                  ? AppColor.white
                  : AppColor.fontBlack,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s32),
              ),
              shadows: [boxShadowOne],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.type == TextInputType.number && widget.withNairaSign
                    ? Row(
                        children: [
                          Text(AppString.naira, style: appTextGray16),
                          const SizedBox(width: AppSize.s4),
                        ],
                      )
                    : Container(),
                Expanded(
                  child: TextField(
                    keyboardType: widget.type == TextInputType.number
                        ? const TextInputType.numberWithOptions(decimal: true)
                        : widget.type,
                    inputFormatters: widget.type == TextInputType.number
                        ? <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              widget.withNairaSign?
                              RegExp(r'^(\d+)?\.?\d{0,2}'):
                              RegExp(r'^(\d+)?\d{0,2}')
                            )
                          ]
                        : null,
                    obscureText: widget.type == TextInputType.visiblePassword
                        ? showPassword
                            ? false
                            : true
                        : false,
                    style: appTextBlack16Bold,
                    controller: widget.controller,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: widget.type == TextInputType.visiblePassword
                          ? appTextBlack16Bold
                          : appTextGray16,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                widget.type != TextInputType.visiblePassword
                    ? Container()
                    : InkWell(
                        child: showPassword
                            ? const Icon(Icons.visibility_off,
                                size: IconSize.s18)
                            : const Icon(Icons.visibility, size: IconSize.s18),
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildPasswordHint(Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: List.generate(
          11,
          (index) => Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    shape: BoxShape.circle,
                  ),
                  height: AppSize.s10,
                  width: AppSize.s10,
                ),
              )),
    ),
  );
}
