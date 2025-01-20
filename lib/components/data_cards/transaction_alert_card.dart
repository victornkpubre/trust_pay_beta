import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_accept_btn.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_reject_btn.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_single_btn.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/transaction_action_extractor.dart';

class TransactionAlertCard extends StatelessWidget {
  final Transaction transaction;
  final User currentUser;
  final String username;
  final String userImage;
  final double width;
  final double height;

  const TransactionAlertCard({super.key,
      required this.userImage,
      required this.width,
      required this.height,
      required this.username,
      required this.transaction,
      required this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
      decoration: ShapeDecoration(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        shadows: [boxShadowTwo],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title and Amount
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          getIcon(transaction.type),
                          height: AppSize.s24,
                          width: AppSize.s24,
                        ),
                        const SizedBox(width: AppSize.s4),
                        Text(getTitle(transaction.type), style: appTextPurple18Bold),
                      ],
                    ),
                    const SizedBox(height: AppSize.s8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: AppString.amount,
                              style: appTextPurple18Bold),
                          TextSpan(
                              text: " ${AppString.naira}${transaction.total}",
                              style: appTextAmber18Bold),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSize.s10),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(username, style: appTextGray16Bold),
                      Text(
                        parseTime(transaction.dateCreated),
                        style: TextStyle(
                          color: AppColor.gray,
                          fontSize: AppSize.s14,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: AppSize.s4),
                  UserImage(image: userImage)
                ],
              ),
            ],
          ),

          _buildButtons(transaction, currentUser),
        ],
      ),
    );
  }
}

_buildButtons(Transaction transaction, User currentUser) {
  if(currentUser.id != null) {
    TransactionActionType action = getTransactionAction(transaction, currentUser.id!);
    switch(action) {
      case TransactionActionType.acceptDecline:
        return const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionCardAcceptButton(),
            TransactionCardRejectButton()
          ],
        );

      case TransactionActionType.makePayment:
        return const TransactionCardSingleButton(title: AppString.makePayment);

      case TransactionActionType.fulfilObligations:
        return const TransactionCardSingleButton(title: AppString.fulfilObligation);

      case TransactionActionType.verifyObligations:
        return const TransactionCardSingleButton(title: AppString.verifyTransaction);

      case TransactionActionType.verifyMediation:
        return const TransactionCardSingleButton(title: AppString.verifyMediation);

      default:
        return TransactionActionType.viewTransaction;
    }
  }
  else {
    return Container();
  }
}
