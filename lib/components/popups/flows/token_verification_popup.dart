import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/feedback/transaction_action_overlay.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/obligation_card.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/texts/obligation_status_text.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';

class TokenVerificationPopup extends StatefulWidget {
  final double width;
  final Obligation obligation;
  final String currency;
  final Function(String) onVerifyToken;

  const TokenVerificationPopup({
    super.key,
    required this.width,
    required this.obligation,
    this.currency = 'NGN',
    required this.onVerifyToken
  });

  @override
  State<TokenVerificationPopup> createState() => _TokenVerificationPopupState();
}

class _TokenVerificationPopupState extends State<TokenVerificationPopup> with WidgetsBindingObserver {
  List<Obligation> selectedObligations = [];
  String token = '';
  bool loading = false;
  double keyboardHeight = 0.0;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      keyboardHeight = bottomInset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, setPopState) {
        return Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight/2),
          child: Stack(
            children: [
              Container(
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
                            amount: widget.obligation.amount.toString(),
                            currencySymbol: currencySymbolFor(widget.currency)
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
                      title: "Verify Token",
                      onTap: () {
                        if (controller.value.text.isNotEmpty) {
                          var result = controller.value.text;
                          widget.onVerifyToken(result);
                          setPopState(() {
                            token = result;
                            loading = true;
                          });
                        } else {
                          showSnackBar(context: context, message: 'Enter the Token');
                        }
                      }
                    ),
                    const SizedBox(height: AppSize.s16),
                    SecondaryButton(
                      title: "Close",
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(height: 32),
                  ]
                )
              ),

              // Spinner, then success or error with Retry/Close
              TransactionActionOverlay(
                running: loading,
                onRetry: () => widget.onVerifyToken(token),
                onCompleted: () => Navigator.of(context).pop(),
                onClose: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    );
  }
}


String generateToken() {
  return (Random()).nextInt(999999 - 111111).toString();
}
