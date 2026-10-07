import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/components/feedback/transaction_action_overlay.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';

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
      required this.onGenerateToken}
  );

  @override
  State<TokenGenerationPopup> createState() => _TokenGenerationPopupState();
}

class _TokenGenerationPopupState extends State<TokenGenerationPopup> with WidgetsBindingObserver {
  List<TokenGenerationObligationInput> selectedObligations = [];
  String token = '';
  bool loading = false;
  double keyboardHeight = 0.0;

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
                token.isNotEmpty?
                Column(
                  children: [
                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                      onTap: () => copyToken(token),
                      child: Container(
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
                            const SizedBox(width: AppSize.s8),
                            Icon(Icons.copy, color: AppColor.primary),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s4),
                    Text('Tap to copy', style: appTextGray14),
                  ],
                ):
                AppSelectInput(
                  width: widget.width,
                  hint: 'Select an Obligation',
                  menuList: (widget.obligations.map((e) => e.title)).toList(),
                  onSelect: (value) {
                    if (value != null) {
                      TokenGenerationObligationInput obligation = widget.obligations.firstWhere((e) => e.title.compareTo(value) == 0);
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

                token.isEmpty?
                Container(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 4),
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
                ): Container(),
                const SizedBox(height: AppSize.s16),
                PrimaryButton(
                  title: token.isEmpty ? "Generate Token" : "Share Token",
                  onTap: () {
                    if (token.isEmpty) {
                      var result = generateToken();
                      widget.onGenerateToken(result);
                      setState(() {
                        token = result;
                        loading = true;
                      });
                    } else {
                      shareToken(token, selectedObligations.map((o) => o.title).toList());
                    }
                  }
                ),
                const SizedBox(height: AppSize.s16),
                SecondaryButton(
                  title: token.isEmpty ? "Select All" : "Close",
                  onTap: () {
                    if (token.isEmpty) {
                      setState(() {
                        selectedObligations = List.from(widget.obligations);
                      });
                    }else {
                      Navigator.of(context).pop();
                    }
                  },
                ),

                const SizedBox(height: 32),
              ]
            )
          ),

          // Spinner, then success or error with Retry/Close
          TransactionActionOverlay(
            running: loading,
            onRetry: () => widget.onGenerateToken(token),
            onClose: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

Future<void> copyToken(String token) async {
  await Clipboard.setData(ClipboardData(text: token));
  // A toast draws above the bottom sheet; a SnackBar would sit behind it.
  toast('Token copied');
}

/// Opens the phone's share sheet (WhatsApp, SMS, email, ...) with the token.
Future<void> shareToken(String token, List<String> obligationTitles) async {
  final forWhat = obligationTitles.isEmpty ? '' : ' for ${obligationTitles.join(', ')}';
  await Share.share(
    'Your TrustPay verification token$forWhat is $token. '
    'Only share it once the obligation has been fulfilled.',
    subject: 'TrustPay verification token',
  );
}

/// Always exactly 6 digits (100000–999999), from a cryptographically
/// secure source — the old version could produce shorter numbers like 4217.
String generateToken() {
  return (100000 + Random.secure().nextInt(900000)).toString();
}
