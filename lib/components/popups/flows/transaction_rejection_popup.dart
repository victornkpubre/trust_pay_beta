import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/feedback/transaction_action_overlay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/transaction_rejection_tile.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';

enum TransactionRejectionPopupState {confirmed, confirming, initiated}
class TransactionRejectionPopup extends StatefulWidget {
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
  final Function(String?) onReject;
  final Function onCancel;
  final TransactionRejectionPopupState? initialState;

  const TransactionRejectionPopup({
    super.key,
    required this.width,
    this.obligations,
    required this.users,
    this.url,
    required this.type,
    required this.onReject,
    required this.onCancel,
    required this.username,
    required this.transactionTitle,
    required this.expiryDate,
    required this.amount,
    required this.transactionDetails,
    this.initialState,
    required this.owner,
    required this.user
  });

  @override
  State<TransactionRejectionPopup> createState() =>
      _TransactionRejectionPopupState();
}

class _TransactionRejectionPopupState extends State<TransactionRejectionPopup> with WidgetsBindingObserver {
  TransactionRejectionPopupState state = TransactionRejectionPopupState.initiated;
  final TextEditingController rejectionFeedBackController = TextEditingController();
  bool loading = false;
  double keyboardHeight = 0.0;

  @override
  void initState() {
    super.initState();
    state = widget.initialState??TransactionRejectionPopupState.initiated;
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
                  padding: const EdgeInsets.only(
                    left: AppSize.s16,
                    right: AppSize.s16,
                  ),
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
                      TransactionRejectionPopupState.initiated==state?
                      _buildPreviewSection(
                          context,
                          widget.obligations??[],
                          widget.users,
                          widget.type,
                          widget.transactionTitle,
                          widget.url,
                          widget.amount,
                          widget.expiryDate
                      ):
                      Container(),

                      TransactionRejectionPopupState.confirming==state?
                      _buildConfirmationSection(
                        widget.username,
                        widget.transactionTitle,
                        rejectionFeedBackController
                      ):
                      Container(),

                      TransactionRejectionPopupState.confirmed==state?
                      _buildCompletedSection(
                        widget.username,
                        widget.transactionTitle,
                        widget.owner,
                        widget.user,
                      ):
                      Container(),

                      PrimaryButton( title: TransactionRejectionPopupState.initiated==state?
                      "Reject Transaction":
                      TransactionRejectionPopupState.confirming==state?
                      "Confirm": "Done",
                          onTap: () async {
                            switch (state) {
                              case TransactionRejectionPopupState.initiated:
                                setPopState(() {
                                  state = TransactionRejectionPopupState.confirming;
                                });
                                break;
                              case TransactionRejectionPopupState.confirming:
                                if(rejectionFeedBackController.value.text.isNotEmpty){
                                  widget.onReject(rejectionFeedBackController.value.text);
                                  setPopState(() {
                                    state = TransactionRejectionPopupState.confirmed;
                                    loading = true;
                                  });
                                }
                                else {
                                  showSnackBar(context: context, message: "A reason for rejection is required");
                                }

                                break;
                              case TransactionRejectionPopupState.confirmed:
                                widget.onCancel();
                                break;
                              default:
                            }
                          }
                      ),
                      const SizedBox(height: AppSize.s16),

                      TransactionRejectionPopupState.confirmed!=state? SecondaryButton(
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
                  onRetry: () => widget.onReject(rejectionFeedBackController.value.text),
                  onClose: () => widget.onCancel(),
                ),

              ],
            ),
          );
        }
    );
  }
}

_buildPreviewSection(context, List<TransactionPopupInput> obligations, List<UserTransactionInput> users, type, title, url, amount, DateTime expiryDate) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      const PopUpBar(),
      const SizedBox(height: AppSize.s16),
      Text(
        'Reject Transaction',
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
        members: users
            .map((e) => UserInput(
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

_buildConfirmationSection(String username, String title, TextEditingController rejectionFeedBackController) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      const PopUpBar(),
      const SizedBox(height: AppSize.s16),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSize.s8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary, width: AppSize.s4),
                borderRadius: BorderRadius.circular(AppSize.s64)),
              child: Icon(
                FontAwesomeIcons.exclamation,
                color: AppColor.primary,
                size: AppSize.s64,
              ),
            ),
            const SizedBox(height: AppSize.s16),

            Text('Rejecting Transaction',
                style: appTextBlack20Bold),
            const SizedBox(height: 8),
            // Text('Transaction Rejected successfully, you are in an agreement with ${username} for ${transactionTitle}'),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                    'Rejecting Transaction from $username for ',
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
            const SizedBox(height: 16),

            Text(
              'Reason for Rejection',
              textAlign: TextAlign.center,
              style: appTextGray16Bold.copyWith(
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(height: 8),
            AppTextAreaInput(
                hint: 'Reason...',
                controller: rejectionFeedBackController),

            const SizedBox(height: AppSize.s16),
          ],
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

      _buildTransactionRejectionImage(owner, user),
      const SizedBox(height: 16),

      Text('Transaction Rejected', style: appTextBlack20Bold),
      const SizedBox(height: 8),
      // Text('Transaction Rejected successfully, you are in an agreement with ${username} for ${transactionTitle}'),
      Text('Transaction Rejected successfully, you are now in an agreement with $username for $transactionTitle',
        textAlign: TextAlign.center,
        style: appTextGray16.copyWith(
          overflow: TextOverflow.visible,
        ),
      ),
      const SizedBox(height: 64),
    ],
  );
}

_buildTransactionRejectionImage(User owner, User user) {
  return TransactionRejectionTile(
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
