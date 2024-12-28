import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/card_number_formatter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppSecondaryTextAreaInput extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool isCardNumberInput;
  final bool isDateInput;
  final int limit;

  const AppSecondaryTextAreaInput({
    super.key,
    required this.hint,
    required this.controller,
    required this.title,
    required this.limit,
    this.isCardNumberInput = false,
    this.isDateInput = false,
  });

  @override
  State<AppSecondaryTextAreaInput> createState() =>
      _AppSecondaryTextAreaInputState();
}

class _AppSecondaryTextAreaInputState extends State<AppSecondaryTextAreaInput> {
  DateTime? dateValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s16, vertical: AppSize.s14),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: AppColor.smokeWhite,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.fontBlack),
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                shadows: [boxShadowOne],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: appTextBlack16Bold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              if (widget.isDateInput) {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1980),
                                    lastDate: DateTime(2050));

                                if (date != null) {
                                  setState(() {
                                    dateValue = date;
                                  });
                                }
                              }
                            },
                            child: !widget.isDateInput
                                ? TextField(
                                    controller: widget.controller,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 1,
                                    style: appTextGray16,
                                    inputFormatters: !widget.isCardNumberInput
                                        ? [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                            LengthLimitingTextInputFormatter(
                                                widget.limit),
                                          ]
                                        : [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                            LengthLimitingTextInputFormatter(
                                                widget.limit),
                                            CardNumberFormatter()
                                          ],
                                    decoration: InputDecoration(
                                      hintText: widget.hint,
                                      hintStyle: appTextGray16,
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: AppSize.s8),
                                      isDense: true,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: AppSize.s8),
                                        child: Text(
                                          dateValue == null
                                              ? 'MM/YYYY'
                                              : DateFormat('MM/yyyy')
                                                  .format(dateValue!),
                                          style: appTextGray16,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
