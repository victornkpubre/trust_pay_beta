import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

enum InvalidTransactionPopupState { completed, accepted, rejected }

class InvalidTransactionPopup extends StatefulWidget {
  final String message;
  final double width;
  final Function onClick;

  const InvalidTransactionPopup(
      {super.key,
      required this.width,
      required this.message,
      required this.onClick});

  @override
  State<InvalidTransactionPopup> createState() =>
      _AcceptTransactionPopupState();
}

class _AcceptTransactionPopupState extends State<InvalidTransactionPopup> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 8),
          const PopUpBar(),
          const SizedBox(height: 64),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: AppColor.red)),
            child: Icon(FontAwesomeIcons.exclamation,
                color: AppColor.red, size: 48),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.width * 5 / 8,
                child: const Text(
                  "Invalid Transaction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF00182D),
                    fontSize: 20,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: widget.width * 6 / 8,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.message,
                        style: TextStyle(
                          color: AppColor.fontGray,
                          fontSize: 14,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
              width: widget.width * 7 / 8,
              child: InkWell(
                onTap: widget.onClick(),
                child: PrimaryButton(title: "Okay!", onTap: () {}),
              )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

getStateTitle(InvalidTransactionPopupState state) {
  switch (state) {
    case InvalidTransactionPopupState.accepted:
      return "Accepted";
    case InvalidTransactionPopupState.completed:
      return "Completed";
    case InvalidTransactionPopupState.rejected:
      return "Rejected";
    default:
  }
}
