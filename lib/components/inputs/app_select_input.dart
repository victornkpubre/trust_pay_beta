import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSelectInput extends StatefulWidget {
  final String? title;
  final String hint;
  final int? height;
  final double width;
  final List<String>? menuList;
  final Function(String?) onSelect;

  const AppSelectInput(
      {super.key,
      this.title,
      this.height,
      required this.hint,
      required this.width,
      this.menuList,
      required this.onSelect});

  @override
  State<AppSelectInput> createState() => _AppSelectInputState();
}

class _AppSelectInputState extends State<AppSelectInput> {
  String? currentSelection;

  @override
  Widget build(BuildContext context) {
    print(widget.menuList);
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null
              ? Container()
              : Text(widget.title!, style: appTextPrimary16Bold),
          const SizedBox(height: AppSize.s8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s16, vertical: AppSize.s8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColor.fontBlack,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s32),
              ),
              shadows: [boxShadowOne],
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (widget.menuList == null) {
                        widget.onSelect(null);
                      }
                    },
                    child: Stack(
                      children: [
                        DropdownButton<String>(
                          hint: Text(widget.hint),
                          // value: widget.hint,
                          isDense: true,
                          isExpanded: true,
                          // icon: const Icon(FontAwesomeIcons.caretDown),
                          items: widget.menuList != null
                              ? widget.menuList!.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList()
                              : [],
                          onChanged: (String? newValue) {
                            setState(() {
                              currentSelection = newValue!;
                            });
                            widget.onSelect(newValue);
                          },
                        ),
                        Positioned.fill(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  FontAwesomeIcons.caretDown,
                                  color: AppColor.darkGray,
                                )
                              ]),
                        )
                      ],
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
