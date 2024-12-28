import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSecondaryDropDownInput extends StatefulWidget {
  final List<String> items;
  final double width;
  final Function(int) onSelect;
  const AppSecondaryDropDownInput(
      {super.key,
      required this.items,
      required this.width,
      required this.onSelect});

  @override
  State<AppSecondaryDropDownInput> createState() =>
      _AppSecondaryDropDownInputState();
}

class _AppSecondaryDropDownInputState extends State<AppSecondaryDropDownInput> {
  bool expanded = false;
  late String currentSelection;

  @override
  void initState() {
    currentSelection = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: AppSize.s4),
          padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
          width: widget.width,
          decoration: BoxDecoration(
            color: AppColor.lightGray,
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.items.map((e) {
                  int index = widget.items.indexOf(e);
                  return GestureDetector(
                    onTap: () {
                      if (expanded) {
                        widget.onSelect(index);
                        setState(() {
                          currentSelection = e;
                          expanded = false;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          expanded
                              ? const SizedBox(height: AppSize.s8)
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s16),
                            child: expanded || index == 0
                                ? !expanded
                                    ? Text(currentSelection,
                                        style: appTextBlack14Bold)
                                    : Text(e, style: appTextBlack14Bold)
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              expanded ? const SizedBox(height: AppSize.s8) : Container(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Container(
                  padding: const EdgeInsets.all(4),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    shape: BoxShape.circle,
                    boxShadow: [boxShadowOneBlack],
                  ),
                  child: Transform.rotate(
                    angle: expanded?pi/2: pi,
                    child: Icon(
                      FontAwesomeIcons.angleLeft,
                      color: AppColor.fontBlack,
                      size: 24,
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
