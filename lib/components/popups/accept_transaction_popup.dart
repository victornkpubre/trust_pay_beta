import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/illustrations/transaction_confrimation.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class AcceptTransactionPopup extends StatefulWidget {
  final String transactionTitle;
  final TransactionType type;
  final UserInput sender;
  final UserInput receiver;
  final double width;
  final Function onCancel;
  final Function onComplete;
  const AcceptTransactionPopup(
      {super.key,
      required this.width,
      required this.transactionTitle,
      required this.onCancel,
      required this.onComplete,
      required this.type,
      required this.sender,
      required this.receiver});

  @override
  State<AcceptTransactionPopup> createState() => _AcceptTransactionPopupState();
}

class _AcceptTransactionPopupState extends State<AcceptTransactionPopup> {
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
          completed
              ? TransactionConfirmationIllustration(
                  senderImage: widget.sender.image,
                  receiverImage: widget.receiver.image,
                  type: widget.type,
                  height: 64,
                  state: TransactionConfirmationState.accepting)
              : Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: AppColor.primary)),
                  child: Icon(FontAwesomeIcons.exclamation,
                      color: AppColor.primary, size: 48),
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
                  completed
                      ? 'Term of Transaction Accepted'
                      : 'Accept Transaction',
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
                        text: completed
                            ? 'Accepted transaction '
                            : 'Accept transaction ',
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
              completed
                  ? Text(
                      'Feedback was sent to "${widget.sender.username}"',
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Container()
            ],
          ),
          const SizedBox(height: 32),
          !completed
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: NoticeTile(
                    width: widget.width,
                    richText: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Note',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' that',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                            ),
                          ),
                          TextSpan(
                            text: ' Accepting ',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'the transaction',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' binds you legally to the Obligations. ',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Unless terminated by both parties.',
                            style: TextStyle(
                              color: AppColor.amber,
                              fontSize: 14,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 32),
          SizedBox(
            width: widget.width * 7 / 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (completed) {
                          widget.onComplete();
                        } else {
                          setState(() {
                            completed = true;
                          });
                        }
                      });
                    },
                    child: PrimaryButton(
                        title: completed ? "Home" : "Continue", onTap: () {})),
                const SizedBox(height: 12),
                !completed
                    ? InkWell(
                        onTap: () {
                          widget.onCancel();
                        },
                        child: SecondaryButton(title: "Cancel", onTap: () {}))
                    : Container(),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
