import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class TokenGenerationObligationInput {
  final int? id;
  final String title;
  const TokenGenerationObligationInput(this.id, this.title);
}

class TokenGenerationPopup extends StatefulWidget {
  final double width;
  final List<TokenGenerationObligationInput> obligations;
  final Function(int) onSelect;
  final Function(String) onGenerateToken;

  const TokenGenerationPopup(
      {super.key,
      required this.width,
      required this.obligations,
      required this.onSelect,
      required this.onGenerateToken});

  @override
  State<TokenGenerationPopup> createState() => _TokenGenerationPopupState();
}

class _TokenGenerationPopupState extends State<TokenGenerationPopup> {
  List<TokenGenerationObligationInput> selectedObligations = [];
  String token = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        width: widget.width,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s8),
              const PopUpBar(),
              const SizedBox(height: AppSize.s16),
              Text(
                'Token Generation',
                textAlign: TextAlign.center,
                style: appTextBlack24Bold,
              ),
              const SizedBox(height: AppSize.s8),
              Text(
                'Generate a token and share it with the seller. This is used to verify the fulfilment of your obligations',
                textAlign: TextAlign.center,
                style: appTextGray14,
              ),
              const SizedBox(height: AppSize.s8),
              token.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.s16, vertical: AppSize.s8),
                      decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(token, style: appTextPrimary32Bold),
                        ],
                      ),
                    )
                  : AppSelectInput(
                      width: widget.width,
                      hint: 'Select an Obligation',
                      menuList:
                          (widget.obligations.map((e) => e.title)).toList(),
                      onSelect: (value) {
                        if (value != null) {
                          TokenGenerationObligationInput obligation = widget.obligations
                              .firstWhere((e) => e.title.compareTo(value) == 0);

                          if (!selectedObligations.contains(obligation)) {
                            setState(() {
                              selectedObligations.add(obligation);
                            });
                            widget.onSelect(obligation.id??-1);
                          }
                        }
                      },
                    ),
              const SizedBox(height: AppSize.s16),
              token.isEmpty
                  ? Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 4),
                      // height: MediaQuery.of(context).size.height / 4,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectedObligations.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSize.s16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedObligations[index].title,
                                          style: appTextPrimary16Bold),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedObligations
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(Icons.cancel),
                                          color: AppColor.red)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.s4),
                              ],
                            );
                          }),
                    )
                  : Container(),
              const SizedBox(height: AppSize.s16),
              SecondaryButton(
                title: token.isEmpty ? "Select All" : "Regenerate",
                onTap: () {
                  if (token.isEmpty) {
                    setState(() {
                      selectedObligations = List.from(widget.obligations);
                    });
                  } else {
                    var result = generateToken();

                    widget.onGenerateToken(result);
                    setState(() {
                      token = result;
                    });
                  }
                },
              ),
              const SizedBox(height: AppSize.s16),
              PrimaryButton(
                  title: token.isEmpty ? "Generate Token" : "Share",
                  onTap: () {
                    if (token.isEmpty) {
                      var result = generateToken();
                      widget.onGenerateToken(result);
                      setState(() {
                        token = result;
                      });
                    } else {
                      shareToken();
                    }
                  }),
              const SizedBox(height: 32),
            ]));
  }
}

void shareToken() {

}

String generateToken() {
  return (Random()).nextInt(999999 - 111111).toString();
}
