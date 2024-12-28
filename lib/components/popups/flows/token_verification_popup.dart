import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/obligation_card.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/texts/obligation_status_text.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';

class TokenVerificationPopup extends StatefulWidget {
  final double width;
  final Obligation obligation;
  final Function(String) onVerifyToken;

  const TokenVerificationPopup({
    super.key,
    required this.width,
    required this.obligation,
    required this.onVerifyToken
  });

  @override
  State<TokenVerificationPopup> createState() => _TokenVerificationPopupState();
}

class _TokenVerificationPopupState extends State<TokenVerificationPopup> {
  List<Obligation> selectedObligations = [];
  String token = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
        ),
        width: widget.width,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s8),
              const PopUpBar(),
              const SizedBox(height: AppSize.s16),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ObligationCard(
                      width: widget.width,
                      title: widget.obligation.title,
                      description: widget.obligation.details??'',
                      amount: widget.obligation.amount.toString()
                  ),
                  const SizedBox(height: AppSize.s8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status', style: appTextPrimary16),
                          ObligationStatusText(
                              status: widget.obligation.status,
                              fontSize: widget.width/24
                          ),
                        ],
                      ),

                      Container(
                        width: widget.width/12,
                        height: widget.width/12,
                        padding: EdgeInsets.all(widget.width/50),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: getObligationBackgroundColor(widget.obligation.status)
                        ),
                        child: SvgPicture.asset(getObligationStatusIcon(widget.obligation.status)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),
              AppTextInput(
                  title: 'Enter Token',
                  type: TextInputType.number,
                  hint: '232134',
                  withNairaSign: false,
                  controller: controller
              ),


              const SizedBox(height: AppSize.s16),
              PrimaryButton(
                  title: token.isEmpty ? "Verify Token" : "Share",
                  onTap: () {
                    if (token.isEmpty) {
                      var result = generateToken();
                      widget.onVerifyToken(result);
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
