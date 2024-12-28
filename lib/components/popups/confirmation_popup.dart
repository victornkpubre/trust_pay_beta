import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

enum ConfirmationPopupState { completed, accepted, rejected }

class ConfirmationPopup extends StatefulWidget {
  final String action;
  final String transactionTitle;
  final double width;
  final ConfirmationPopupState state;
  final Function onClick;

  const ConfirmationPopup(
      {super.key,
      required this.width,
      required this.transactionTitle,
      required this.action,
      required this.state,
      required this.onClick});

  @override
  State<ConfirmationPopup> createState() => _AcceptTransactionPopupState();
}

class _AcceptTransactionPopupState extends State<ConfirmationPopup> {
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
                color: widget.state == ConfirmationPopupState.accepted
                    ? AppColor.amber
                    : widget.state == ConfirmationPopupState.rejected
                        ? AppColor.lightRed
                        : AppColor.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4, 4),
                      color: AppColor.gray,
                      blurRadius: 4,
                      spreadRadius: 4)
                ]),
            child: Icon(
                widget.state == ConfirmationPopupState.rejected
                    ? FontAwesomeIcons.xmark
                    : Icons.check,
                color: AppColor.white,
                size: 48),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.width * 5 / 8,
                child: Text(
                  '${widget.action} ${getStateTitle(widget.state)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                        text: '${widget.action} for ',
                        style: TextStyle(
                          color: AppColor.fontGray,
                          fontSize: 14,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "\"${widget.transactionTitle}\"",
                        style: TextStyle(
                          color: AppColor.fontGray,
                          fontSize: 14,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
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

getStateTitle(ConfirmationPopupState state) {
  switch (state) {
    case ConfirmationPopupState.accepted:
      return "Accepted";
    case ConfirmationPopupState.completed:
      return "Completed";
    case ConfirmationPopupState.rejected:
      return "Rejected";
    default:
  }
}
