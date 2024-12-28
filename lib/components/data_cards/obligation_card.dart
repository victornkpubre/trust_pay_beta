import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class ObligationCard extends StatefulWidget {
  final double width;
  final String title;
  final String description;
  final String amount;
  final Function()? onDelete;
  const ObligationCard(
      {super.key,
      required this.width,
      required this.title,
      required this.description,
      required this.amount,
      this.onDelete});

  @override
  State<ObligationCard> createState() => _ObligationCardState();
}

class _ObligationCardState extends State<ObligationCard> {
  bool expanded = false;
  bool deleting = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          //Delete Layer
          Container(
            width: widget.width,
            height: double.infinity,
            decoration: ShapeDecoration(
                color: AppColor.lightRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s18),
                )),
            padding: const EdgeInsets.all(AppSize.s16),
            child: InkWell(
              onTap: () {
                widget.onDelete;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(FontAwesomeIcons.trashCan, color: AppColor.white)
                ],
              ),
            ),
          ),

          GestureDetector(
            onHorizontalDragEnd: (details) {
              if(widget.onDelete != null) {
                if (!deleting) {
                  setState(() {
                    deleting = true;
                  });

                  Timer(const Duration(seconds: 2), () {
                    setState(() {
                      deleting = false;
                    });
                  });
                }
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: deleting ? widget.width * 0.7 : widget.width,
              padding: const EdgeInsets.all(AppSize.s16),
              decoration: ShapeDecoration(
                color: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s18),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColor.amber,
                                      fontSize: FontSize.s20,
                                      fontFamily: 'FarnhamDisplay-Regular',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        child: Container(
                            width: AppSize.s24,
                            height: AppSize.s24,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.1599999964237213),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s16),
                              ),
                            ),
                            child: Transform.rotate(
                              angle: !expanded ? pi / 2 : 0,
                              child: Icon(
                                FontAwesomeIcons.angleUp,
                                color: AppColor.lightGray,
                                size: AppSize.s16,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s16),
                  !expanded
                      ? Container()
                      : SingleChildScrollView(
                          child: Text(
                            widget.description,
                            style: appTextWhite12,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                  !expanded ? Container() : const SizedBox(height: AppSize.s16),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.90,
                                child: Text(AppString.naira,
                                    style: appTextWhite20Bold),
                              ),
                              const SizedBox(width: AppSize.s8),
                              Text(widget.amount, style: appTextWhite20Bold),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
