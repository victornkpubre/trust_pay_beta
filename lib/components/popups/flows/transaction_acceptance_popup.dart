import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_acceptance_dialog.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/transaction_acceptance_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_rejection_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionAcceptancePopup extends StatefulWidget {
  final double width;
  final double height;
  final TransactionType type;
  final List<TransactionAcceptanceInput>? obligations;
  final List<UserTransactionInput> users;
  final String details;
  final String? url;
  final String username;
  final String transactionTitle;
  final Function onAccept;
  final Function(String?) onReject;

  const TransactionAcceptancePopup(
      {super.key,
      required this.width,
      this.obligations,
      required this.users,
      required this.height,
      required this.details,
      this.url,
      required this.type,
      required this.onAccept,
      required this.onReject,
      required this.username,
      required this.transactionTitle});

  @override
  State<TransactionAcceptancePopup> createState() =>
      _TransactionAcceptancePopupState();
}

class _TransactionAcceptancePopupState
    extends State<TransactionAcceptancePopup> {
  bool completed = false;
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    // return _buildTransactionView(widget, context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        width: widget.width,
        child: completed
            ? _buildCompletedView(
                widget.username, widget.transactionTitle, accepted)
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.s8),
                  const PopUpBar(),
                  const SizedBox(height: AppSize.s16),
                  Text(
                    'Accept Transaction',
                    textAlign: TextAlign.center,
                    style: appTextBlack18Bold,
                  ),
                  const SizedBox(height: AppSize.s8),
                  TransactionDetailsCard(
                    title: "110k take 1m",
                    width: 350,
                    date: DateTime.now(),
                    type: widget.type,
                    status: TransactionStatus.pending,
                    amount: "100,000",
                    members: widget.users
                        .map((e) => UserInput(
                              image: ProfileIconAssets.avatar,
                              username: e.username,
                              account: e.account,
                              totalTransaction: e.totalTransaction,
                              completionRate: e.completionRate,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: AppSize.s20),

                  InkWell(
                      onTap: () {
                        showTransactionAcceptanceDialog(
                            context: context,
                            obligations: widget.obligations,
                            users: widget.users,
                            type: widget.type,
                            details: widget.details,
                            url: widget.url ?? '');
                      },
                      child: _buildTransactionDetailsSection(
                          widget.type, widget.obligations, widget.users)),
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
                        '₦320,000',
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
                        'Service Fee:(1.5%)',
                        textAlign: TextAlign.center,
                        style: appTextGray16,
                      ),
                      Text(
                        '₦3,000',
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
                        '₦323,000',
                        textAlign: TextAlign.center,
                        style: appTextAmber16,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s16),

                  PrimaryButton(
                      title: "Accept Transaction",
                      onTap: () async {
                        accepted = true;
                        bool? result = await showAcceptanceFeedbackDialog(
                            context,
                            widget.type,
                            widget.username,
                            widget.transactionTitle);
                        if (result != null && result) {
                          widget.onAccept();
                          setState(() {
                            completed = true;
                          });
                        }
                      }),
                  const SizedBox(height: AppSize.s16),

                  SecondaryButton(
                      title: "Reject Transaction",
                      onTap: () async {
                        accepted = false;
                        String? feedback = await showRejectionFeedbackDialog(
                            context,
                            widget.type,
                            widget.username,
                            widget.transactionTitle);

                        if (feedback != null) {
                          if (feedback.compareTo('cancelled') != 0) {
                            widget.onReject(feedback);
                            setState(() {
                              completed = true;
                            });
                          }
                        } else {
                          widget.onReject(feedback);
                          setState(() {
                            completed = true;
                          });
                        }
                      }),
                  const SizedBox(height: AppSize.s32),
                ],
              ));
  }
}

_buildCompletedView(username, transactionTitle, accepted) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      const PopUpBar(),
      const SizedBox(height: AppSize.s32),

      accepted
          ? _buildTransactionAcceptanceImage()
          : _buildTransactionRejectionImage(),
      const SizedBox(height: 16),

      Text(accepted ? 'Transaction Accepted' : 'Transaction Rejected',
          style: appTextBlack20Bold),
      const SizedBox(height: 8),
      // Text('Transaction accepted successfully, you are in an agreement with ${username} for ${transactionTitle}'),
      Text(
        accepted
            ? 'Transaction accepted successfully, you are now in an agreement with $username for $transactionTitle'
            : 'Transaction rejected successfully, your feedback has been sent to $username',
        textAlign: TextAlign.center,
        style: appTextGray16.copyWith(
          overflow: TextOverflow.visible,
        ),
      ),
      const SizedBox(height: 32),

      PrimaryButton(title: accepted ? "View" : "Go Home", onTap: () {}),

      accepted ? const SizedBox(height: AppSize.s16) : Container(),
      accepted ? SecondaryButton(title: "Go Home", onTap: () {}) : Container(),
      const SizedBox(height: AppSize.s32)
    ],
  );
}

_buildTransactionAcceptanceImage() {
  return TransactionAcceptanceTile(
      tileSize: AppSize.s50 * 2,
      iconSize: AppSize.s38,
      type: TransactionType.betsWagers,
      owner: UserInput(
          image: ProfileIconAssets.avatar,
          username: "Victor Nelson",
          account: "#4234564",
          totalTransaction: 25,
          completionRate: 89),
      member: UserInput(
          image: ProfileIconAssets.avatar,
          username: "Von Doom",
          account: "#4234564",
          totalTransaction: 25,
          completionRate: 89));
}

_buildTransactionRejectionImage() {
  return TransactionRejectionTile(
      tileSize: AppSize.s50 * 2,
      iconSize: AppSize.s38,
      type: TransactionType.betsWagers,
      owner: UserInput(
          image: ProfileIconAssets.avatar,
          username: "Victor Nelson",
          account: "#4234564",
          totalTransaction: 25,
          completionRate: 89),
      member: UserInput(
          image: ProfileIconAssets.avatar,
          username: "Von Doom",
          account: "#4234564",
          totalTransaction: 25,
          completionRate: 89));
}

_buildTransactionDetailsSection(
    TransactionType type, List? obligations, List<UserTransactionInput> users) {
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
