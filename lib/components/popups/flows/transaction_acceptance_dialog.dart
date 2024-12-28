import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/indicators/payee_payment_indicator.dart';
import 'package:trust_pay_beta/components/indicators/payee_user_indicator.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input.dart';
import 'package:trust_pay_beta/components/list_iems/obligation_list_item.dart';
import 'package:trust_pay_beta/components/list_iems/user_profile_status_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/tiles/source_of_truth_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

showTransactionAcceptanceDialog(
    {required context,
    required obligations,
    required List<UserTransactionInput> users,
    required details,
    required url,
    required type}) {
  switch (type) {
    case TransactionType.secureSales:
      _showSecureSalesDetailsDialog(context, obligations);
      break;
    case TransactionType.betsWagers:
      _showBetsWagerDetailsDialog(context, details, url);
      break;
    case TransactionType.billSplitter:
      _showBillSplitterDetailsDailog(context, users, type);
    case TransactionType.groupGoals:
      _showGroupGoalsDetailsDailog(context, users, type);
      break;
    case TransactionType.moneyPool:
      _showMembersDetailsDailog(context, users, type);
      break;
    default:
      _showSecureSalesDetailsDialog(context, obligations);
  }
}

void _showMembersDetailsDailog(
    context, List<UserTransactionInput> users, type) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: AppSize.s64),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16, vertical: AppSize.s4),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Transaction Payee', style: appTextBlack24Bold),
                          const SizedBox(height: AppSize.s8),
                          PayeeUserIndicator(
                              date: DateTime.now(),
                              group: type == TransactionType.groupGoals? true: false,
                              amount: 200000,
                              percentageCompletion: 0.1,
                              width: double.infinity,
                              users: users
                                  .map((e) => (UserInput(
                                        image: ProfileIconAssets.avatar,
                                        username: e.username,
                                        account: e.account,
                                        totalTransaction: e.totalTransaction,
                                        completionRate: e.completionRate,
                                      )))
                                  .toList()),
                          const SizedBox(height: AppSize.s16),
                          Text('Members', style: appTextBlack14Bold),
                          const SizedBox(height: AppSize.s8),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    UserProfileStatusListItem(
                                        user: UserInput(
                                          image: ProfileIconAssets.avatar,
                                          username: users[index].username,
                                          account: users[index].account,
                                          totalTransaction:
                                              users[index].totalTransaction,
                                          completionRate:
                                              users[index].completionRate,
                                        ),
                                        textColor: AppColor.fontBlack,
                                        amount: 323000,
                                        transactionStatus: users[index].status),
                                    const SizedBox(height: AppSize.s32),
                                  ],
                                );
                              })
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      });
}

void _showBillSplitterDetailsDailog(
    context, List<UserTransactionInput> users, type) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: AppBackButton(size: AppSize.s16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bill Details', style: appTextBlack20Bold)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16, vertical: AppSize.s4),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s16, vertical: AppSize.s8),
                            decoration: BoxDecoration(
                                color: AppColor.secondary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppSize.s10))),
                            child: PayeePaymentIndicator(
                              width: MediaQuery.of(context).size.width,
                              paymentFulfilled: 12,
                              // fontSize: AppSize.s16,
                              paymentsTotal: 20,
                              payee: 'The Place',
                            ),
                          ),
                          const SizedBox(height: AppSize.s16),
                          Text('Members', style: appTextBlack14Bold),
                          const SizedBox(height: AppSize.s8),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    UserProfileStatusListItem(
                                        user: UserInput(
                                          image: ProfileIconAssets.avatar,
                                          username: users[index].username,
                                          account: users[index].account,
                                          totalTransaction:
                                              users[index].totalTransaction,
                                          completionRate:
                                              users[index].completionRate,
                                        ),
                                        textColor: AppColor.fontBlack,
                                        amount: 323000,
                                        transactionStatus: users[index].status),
                                    const SizedBox(height: AppSize.s16),
                                  ],
                                );
                              })
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      });
}

void _showGroupGoalsDetailsDailog(
    context, List<UserTransactionInput> users, type) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: AppBackButton(size: AppSize.s16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Group Details', style: appTextBlack20Bold)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16, vertical: AppSize.s4),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PayeeUserIndicator(
                            title: 'Group',
                            date: DateTime.now(),
                            group: type == TransactionType.groupGoals? true: false,
                            amount: 200000,
                            percentageCompletion: 0.1,
                            width: MediaQuery.of(context).size.width,
                            users: users
                                .map((e) => (UserInput(
                                      image: ProfileIconAssets.avatar,
                                      username: e.username,
                                      account: e.account,
                                      totalTransaction: e.totalTransaction,
                                      completionRate: e.completionRate,
                                    )))
                                .toList()
                          ),
                          const SizedBox(height: AppSize.s16),
                          Text('Members', style: appTextBlack18Bold),
                          const SizedBox(height: AppSize.s8),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    UserProfileStatusListItem(
                                        user: UserInput(
                                          image: ProfileIconAssets.avatar,
                                          username: users[index].username,
                                          account: users[index].account,
                                          totalTransaction:
                                              users[index].totalTransaction,
                                          completionRate:
                                              users[index].completionRate,
                                        ),
                                        textColor: AppColor.fontBlack,
                                        amount: 323000,
                                        transactionStatus: users[index].status),
                                    const SizedBox(height: AppSize.s16),
                                  ],
                                );
                              })
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      });
}

void _showBetsWagerDetailsDialog(context, details, url) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: AppBackButton(size: AppSize.s16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Wager Details', style: appTextBlack20Bold)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.s16, vertical: AppSize.s4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SourceOfTruthTile(url: url, details: details)
                      ])),
            ],
          ),
        );
      });
}

void _showSecureSalesDetailsDialog(context, List obligations) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: AppBackButton(size: AppSize.s16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Obligations', style: appTextBlack20Bold)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16, vertical: AppSize.s4),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(thickness: 1, color: AppColor.lightGray),
                          Column(
                              children: obligations
                                  .map((obligation) => Container(
                                        child: Column(
                                          children: [
                                            ObligationListItem(
                                                title: obligation.title,
                                                amount: obligation.amount,
                                                dateTime: obligation.date),
                                            const SizedBox(height: AppSize.s8),
                                            Divider(
                                                thickness: 1,
                                                color: AppColor.lightGray),
                                          ],
                                        ),
                                      ))
                                  .toList()),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      });
}

Future<String?> showRejectionFeedbackDialog(context, type, username, title) {
  TextEditingController rejectionFeedBackController = TextEditingController();

  return showDialog<String>(
      context: context,
      builder: (context) {
        return Container(
          color: AppColor.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSize.s64),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16, vertical: AppSize.s4),
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
                                borderRadius:
                                    BorderRadius.circular(AppSize.s64)),
                            child: Icon(
                              FontAwesomeIcons.exclamation,
                              color: AppColor.primary,
                              size: AppSize.s64,
                            ),
                          ),
                          const SizedBox(height: 32),

                          Text('Rejecting Transaction',
                              style: appTextBlack20Bold),
                          const SizedBox(height: 8),
                          // Text('Transaction accepted successfully, you are in an agreement with ${username} for ${transactionTitle}'),
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
                          const SizedBox(height: 32),

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
                          const SizedBox(height: AppSize.s64),

                          PrimaryButton(
                              title: "Continue",
                              onTap: () {
                                Navigator.pop(
                                    context, rejectionFeedBackController.text);
                              }),
                          const SizedBox(height: AppSize.s16),

                          SecondaryButton(
                              title: "Cancel",
                              onTap: () {
                                Navigator.pop(context, 'cancelled');
                              }),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      });
}

Future<bool?> showAcceptanceFeedbackDialog(context, type, username, title) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return Container(
            color: AppColor.white,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: AppSize.s64),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s16, vertical: AppSize.s4),
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

                      PrimaryButton(
                          title: "Contine",
                          onTap: () {
                            Navigator.pop(context, true);
                          }),
                      const SizedBox(height: AppSize.s16),

                      SecondaryButton(
                          title: "Cancel",
                          onTap: () async {
                            Navigator.pop(context, false);
                          }),
                      const SizedBox(height: AppSize.s32),
                    ],
                  ),
                ),
              )),
            ]));
      });
}
