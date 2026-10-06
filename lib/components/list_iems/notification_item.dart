import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class NotificationItem extends StatelessWidget {
  final String username;
  final String image;
  final String message;
  final NotificationKind kind;
  final String? amount;
  final TransactionInput? transaction;
  final double size;
  const NotificationItem(
      {super.key,
      required this.username,
      required this.image,
      required this.message,
      required this.kind,
      this.transaction,
      this.amount,
      required this.size});

  @override
  Widget build(BuildContext context) {
    if (kind == NotificationKind.message || transaction == null) {
      return UserProfileTile(
        size: size,
        username: username,
        image: image,
        expanded: false,
        account: message,
      );
    }

    return Row(
      children: [
        Expanded(
          child: UserProfileTile(
            size: size,
            username: username,
            image: image,
            expanded: false,
            transaction: TransactionInput(
              createdAt: transaction!.createdAt,
              status: transaction!.status,
              type: TransactionType.betsWagers
            )
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Image.asset(getIcon(transaction!.type),
                    height: size / 2.5, width: size / 2.5),
                const SizedBox(width: 4),
                Text(
                  getTitle(transaction!.type),
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
