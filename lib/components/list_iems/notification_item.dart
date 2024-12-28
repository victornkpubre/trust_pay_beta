import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class NotificationItem extends StatelessWidget {
  final String username;
  final String image;
  final String amount;
  final DateTime createdAt;
  final double size;
  final TransactionInput transaction;
  const NotificationItem(
      {super.key,
      required this.username,
      required this.image,
      required this.transaction,
      required this.amount,
      required this.size,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UserProfileTile(
              size: size,
              username: username,
              image: image,
              expanded: false,
              transaction: TransactionInput(
                  createdAt: transaction.createdAt,
                  status: transaction.status,
                  type: TransactionType.betsWagers)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Image.asset(getIcon(transaction.type),
                    height: size / 2.5, width: size / 2.5),
                const SizedBox(width: 4),
                Text(
                  getTitle(transaction.type),
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: size / 3.8,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              "₦$amount",
              style: TextStyle(
                color: AppColor.fontGray,
                fontSize: size / 3.3,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )
      ],
    );
  }
}
