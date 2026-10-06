import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/feedback/transaction_action_overlay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_acceptance_tile.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';

enum TransactionAcceptancePopupState {confirmed, confirming, initiated}
class TransactionAcceptancePopup extends StatefulWidget {
  final double width;
  final double amount;
  final TransactionType type;
  final List<TransactionPopupInput>? obligations;
  final List<UserTransactionInput> users;
  final String transactionDetails;
  final String? url;
  final String username;
  final String transactionTitle;
  final DateTime expiryDate;
  final User owner;
  final User user;
  final Function onAccept;
  final Function onCancel;

  const TransactionAcceptancePopup (
      {super.key,
      required this.width,
      this.obligations,
      required this.users,
      required this.transactionDetails,
      this.url,
      required this.type,
      required this.onAccept,
      required this.onCancel,
      required this.username,
      required this.transactionTitle, 
      required this.expiryDate,
      required this.amount,
      required this.owner,
      required this.user
  });

  @override
  State<TransactionAcceptancePopup> createState() =>
      _TransactionAcceptancePopupState();
}

class _TransactionAcceptancePopupState extends State<TransactionAcceptancePopup> {
  TransactionAcceptancePopupState state = TransactionAcceptancePopupState.initiated;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setPopState) {
        return Stack(
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

                  TransactionAcceptancePopupState.initiated==state?
                  _buildPreviewSection(
                      context,
                      widget.transactionTitle,
                      widget.expiryDate,
                      widget.obligations??[],
                      widget.users,
                      widget.type,
                      widget.transactionDetails,
                      widget.url,
                      widget.amount
                  ):
                  Container(),

                  TransactionAcceptancePopupState.confirming==state?
                  _buildConfirmationSection(
                      widget.username,
                      widget.transactionTitle,
                  ):
                  Container(),

                  TransactionAcceptancePopupState.confirmed==state?
                  _buildCompletedSection(
                      widget.username,
                      widget.transactionTitle,
                      widget.owner,
                      widget.user,
                  ):
                  Container(),

                  PrimaryButton( title: TransactionAcceptancePopupState.initiated==state?
                    "Accept Transaction":
                    TransactionAcceptancePopupState.confirming==state?
                      "Confirm": "Done",
                    onTap: () async {
                      switch (state) {
                        case TransactionAcceptancePopupState.initiated:
                          setPopState(() {
                            state = TransactionAcceptancePopupState.confirming;
                          });
                          break;
                        case TransactionAcceptancePopupState.confirming:
                          widget.onAccept();
                          setPopState(() {
                            loading = true;
                            state = TransactionAcceptancePopupState.confirmed;
                          });
                          break;
                        case TransactionAcceptancePopupState.confirmed:
                          widget.onCancel();
                          break;
                        default:
                      }
                    }
                  ),
                  const SizedBox(height: AppSize.s16),

                  TransactionAcceptancePopupState.confirmed!=state? SecondaryButton(
                    title: "Cancel",
                    onTap: () {
                      widget.onCancel();
                    }
                  ): Container(),
                  const SizedBox(height: AppSize.s32),
                ],
              )
            ),

            // Spinner, then success or error with Retry/Close
            TransactionActionOverlay(
              running: loading,
              onRetry: () => widget.onAccept(),
              onClose: () => widget.onCancel(),
            ),
          ],
        );
      }
    );
  }
}



_buildPreviewSection(context, String title, DateTime expiryDate, List<TransactionPopupInput> obligations, List<UserTransactionInput> users, type, transactionDetails, url, amount) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      const PopUpBar(),
      const SizedBox(height: AppSize.s16),
      Text(
        'Accept Transaction',
        textAlign: TextAlign.center,
        style: appTextBlack24Bold,
      ),
      const SizedBox(height: AppSize.s8),
      TransactionDetailsCard(
        title: title,
        width: MediaQuery.of(context).size.width,
        date: expiryDate,
        type: type,
        status: TransactionStatus.pending,
        amount: parseAmountDouble(amount),
        members: users.map((e) => UserInput(
          image: e.image,
          username: e.username,
          account: e.account,
          totalTransaction: e.totalTransaction,
          completionRate: e.completionRate,
        )).toList(),
      ),
      const SizedBox(height: AppSize.s20),

      _buildTransactionDetailsSection(type, obligations, users),
      Divider(thickness: 1, color: AppColor.lightGray),

      //Transaction Amount
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amount',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(amount),
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppConstants.serviceFeeLabel,
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(amount*AppConstants.SERVICE_FEE),
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(amount*(1+AppConstants.SERVICE_FEE)),
            textAlign: TextAlign.center,
            style: appTextAmber16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s16),
    ],
  );
}

_buildConfirmationSection(String username, String title) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s64),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s4),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSize.s8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.primary, width: AppSize.s4),
                    borderRadius: BorderRadius.circular(AppSize.s64)),
                child: Icon(
                  FontAwesomeIcons.exclamation,
                  color: AppColor.primary,
                  size: AppSize.s64,
                ),
              ),
              const SizedBox(height: 32),

              Text('Accepting Transaction', style: appTextBlack20Bold),
              const SizedBox(height: 8),
              // Text('Transaction accepted successfully, you are in an agreement with ${username} for ${transactionTitle}'),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                      'Accepting Transaction from $username for ',
                      style: TextStyle(
                        color: AppColor.fontGray,
                        fontSize: 14,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "\"$title\"",
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
              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: NoticeTile(
                  width: double.infinity,
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
                          text:
                          ' binds you legally to the Obligations. ',
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
              ),
              const SizedBox(height: AppSize.s32),
            ],
          ),
        ),
      ),
    ],
  );
}

_buildCompletedSection(username, transactionTitle, User owner, User user) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      const PopUpBar(),
      const SizedBox(height: AppSize.s32),

      _buildTransactionAcceptanceImage(owner, user),
      const SizedBox(height: 16),

      Text('Transaction Accepted', style: appTextBlack20Bold),
      const SizedBox(height: 8),
      // Text('Transaction accepted successfully, you are in an agreement with ${username} for ${transactionTitle}'),
      Text('Transaction accepted successfully, you are now in an agreement with $username for $transactionTitle',
        textAlign: TextAlign.center,
        style: appTextGray16.copyWith(
          overflow: TextOverflow.visible,
        ),
      ),
      const SizedBox(height: 64),
    ],
  );
}

_buildTransactionAcceptanceImage(User owner, User user) {
  return TransactionAcceptanceTile(
      tileSize: AppSize.s50 * 3,
      iconSize: AppSize.s50,
      type: TransactionType.betsWagers,
      owner: UserInput(
          image: owner.profileImage,
          username: owner.firstName,
          account: owner.account?.accountNumber??'#No account number',
          totalTransaction: 25,
          completionRate: 89),
      member: UserInput(
          image: user.profileImage,
          username: user.firstName,
          account: user.account?.accountNumber??'',
          totalTransaction: 25,
          completionRate: 89));
}

_buildTransactionDetailsSection(TransactionType type, List? obligations, List<UserTransactionInput> users) {
  String lead = "";
  String tail = "";

  switch (type) {
    case TransactionType.secureSales:
      lead = 'Obligations';
      tail = obligations!.length.toString();
      break;
    case TransactionType.betsWagers:
      lead = 'Bet against';
      tail = users[0].username;
      break;
    case TransactionType.billSplitter:
    case TransactionType.groupGoals:
    case TransactionType.moneyPool:
      lead = 'Members';
      tail = users.length.toString();
      break;
    default:
      lead = 'Obligations';
      tail = '0';
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lead,
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            tail,
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          'View Details',
          textAlign: TextAlign.center,
          style: appTextGray12,
        ),
      ),
    ],
  );
}
