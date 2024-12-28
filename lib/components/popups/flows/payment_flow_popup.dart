import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input_secondary.dart';
import 'package:trust_pay_beta/components/popups/confirmation_popup.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/routes.dart';

class PaymentFlowPopup extends StatefulWidget {
  final double width;
  final String amount;
  final bool Function() onSubmit;
  final Function() onReview;
  final Function() onHome;
  const PaymentFlowPopup(
      {super.key,
      required this.width,
      required this.amount,
      required this.onSubmit,
      required this.onReview,
      required this.onHome});

  @override
  State<PaymentFlowPopup> createState() => _PaymentFlowPopupState();
}

class _PaymentFlowPopupState extends State<PaymentFlowPopup> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();
  String? bank;

  bool isBankPayment = false;
  bool? paymentIsCompleted;

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
          const SizedBox(height: AppSize.s8),
          const PopUpBar(),
          const SizedBox(height: AppSize.s16),
          paymentIsCompleted != null
              ? _buildPaymentSubmittedView(
                  width: widget.width,
                  paymentIsCompleted: paymentIsCompleted!,
                  onHome: widget.onHome,
                  onRetry: () {
                    setState(() {
                      paymentIsCompleted = null;
                    });
                  },
                  onReview: widget.onReview)
              : _buildPaymentEntryForm(
                  context: context,
                  width: widget.width,
                  amount: widget.amount,
                  bank: bank,
                  accountNumberController: accountNumberController,
                  cardCvvController: cardCvvController,
                  cardDateController: cardDateController,
                  cardNumberController: cardNumberController,
                  isBankPayment: isBankPayment,
                  onSubmit: () {
                    bool? result = widget.onSubmit();
                    setState(() {
                      paymentIsCompleted = result;
                    });
                  },
                  onTap: () {
                    setState(() {
                      isBankPayment = !isBankPayment;
                    });
                  }),
          const SizedBox(height: AppSize.s16),
        ],
      ),
    );
  }
}

_buildPaymentEntryForm(
    {required BuildContext context,
    required double width,
    required String amount,
    required String? bank,
    required accountNumberController,
    required cardNumberController,
    required cardDateController,
    required bool isBankPayment,
    required Function() onSubmit,
    required Function() onTap,
    required cardCvvController}) {
  return Column(children: [
    Image.asset(
      ImageAssets.logo,
      height: width / 4,
      width: width / 4,
    ),
    // const SizedBox(height: AppSize.s16),

    Text(
      'Payment',
      style: appTextBlack18Bold,
    ),
    Text(
      amount,
      style: appTextGray16Bold,
    ),
    const SizedBox(height: AppSize.s16),

    //Payment Type
    Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.s16, horizontal: AppSize.s4),
            decoration: BoxDecoration(
                color: isBankPayment ? AppColor.primary : AppColor.white,
                border: Border.symmetric(
                    horizontal: BorderSide(color: AppColor.primary, width: 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIconAssets.bank_icon,
                    colorFilter: isBankPayment
                        ? ColorFilter.mode(AppColor.white, BlendMode.srcIn)
                        : ColorFilter.mode(AppColor.primary, BlendMode.srcIn)),
                const SizedBox(width: AppSize.s8),
                Text("Bank Transfer",
                    style: isBankPayment
                        ? appTextWhite14Bold
                        : appTextPrimary14Bold),
              ],
            ),
          ),
        )),
        Expanded(
            child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.s16, horizontal: AppSize.s4),
            decoration: BoxDecoration(
                color: isBankPayment ? AppColor.white : AppColor.primary,
                border: Border.symmetric(
                    horizontal: BorderSide(color: AppColor.primary, width: 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIconAssets.card_icon,
                    colorFilter: isBankPayment
                        ? ColorFilter.mode(AppColor.primary, BlendMode.srcIn)
                        : ColorFilter.mode(AppColor.white, BlendMode.srcIn)),
                const SizedBox(width: AppSize.s8),
                Text("Card Payment",
                    style: isBankPayment
                        ? appTextPrimary14Bold
                        : appTextWhite14Bold),
              ],
            ),
          ),
        )),
      ],
    ),
    const SizedBox(height: AppSize.s16),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Column(
        children: [
          !isBankPayment
              ? Container()
              : InkWell(
                  onTap: () async {
                    // bank = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SelectInputIntent()));
                  },
                  child: AppSecondarySelectInput(
                      hint: bank ?? 'Choose your Bank')),
          !isBankPayment ? Container() : const SizedBox(height: AppSize.s16),
          !isBankPayment
              ? Container()
              : AppSecondaryTextAreaInput(
                  title: 'ACCOUNT NUMBER',
                  hint: '00000000000',
                  limit: 11,
                  controller: accountNumberController,
                ),
          !isBankPayment ? Container() : const SizedBox(height: AppSize.s16),
          isBankPayment
              ? Container()
              : AppSecondaryTextAreaInput(
                  title: 'CARD NUMBER',
                  hint: '0000 0000 0000 0000',
                  limit: 16,
                  controller: cardNumberController,
                  isCardNumberInput: true,
                ),
          isBankPayment ? Container() : const SizedBox(height: AppSize.s16),
          isBankPayment
              ? Container()
              : Row(
                  children: [
                    Expanded(
                      child: AppSecondaryTextAreaInput(
                        title: 'VALID TILL',
                        hint: 'MM/YYYY',
                        limit: 7,
                        controller: cardDateController,
                        isDateInput: true,
                      ),
                    ),
                    const SizedBox(width: AppSize.s16),
                    Expanded(
                      child: AppSecondaryTextAreaInput(
                        title: 'CVV',
                        hint: '999',
                        limit: 3,
                        controller: cardCvvController,
                      ),
                    ),
                  ],
                ),
          isBankPayment ? Container() : const SizedBox(height: AppSize.s16),
          PrimaryButton(
              title: 'Continue',
              onTap: () {
                onSubmit();
              }),
        ],
      ),
    ),
    const SizedBox(height: AppSize.s32),
  ]);
}

_buildPaymentSubmittedView(
    {required double width,
    required Function() onReview,
    required Function() onHome,
    required Function() onRetry,
    required bool paymentIsCompleted}) {
  ConfirmationPopupState state = ConfirmationPopupState.rejected;
  if (paymentIsCompleted) {
    state = ConfirmationPopupState.completed;
  }

  return Column(
    children: [
      const SizedBox(height: AppSize.s48),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: state == ConfirmationPopupState.accepted
                ? AppColor.amber
                : state == ConfirmationPopupState.rejected
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
            state == ConfirmationPopupState.rejected
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
            width: width * 5 / 8,
            child: Text(
              state == ConfirmationPopupState.rejected
                  ? 'Payment Failed'
                  : 'Payment Successful',
              textAlign: TextAlign.center,
              style: appTextBlack24Bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: width * 6 / 8,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: state == ConfirmationPopupState.rejected
                          ? 'Your payment failed, please try again'
                          : 'Your payment was successful, the other parties will be',
                      style: appTextGray14),
                  TextSpan(
                      text: state == ConfirmationPopupState.rejected
                          ? ""
                          : "\"notified\"",
                      style: appTextGray14Bold),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      const SizedBox(height: 32),
      SecondaryButton(
        title: state == ConfirmationPopupState.rejected ? "Retry" : "Review",
        onTap: () {
          if (state == ConfirmationPopupState.rejected) {
            onRetry();
          } else {
            onReview();
          }
        },
      ),
      const SizedBox(height: AppSize.s16),
      PrimaryButton(
        title: "Go Home",
        onTap: () {
          onHome();
        },
      ),
      const SizedBox(height: 32),
    ],
  );
}
