import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class UserProfileTile extends StatelessWidget {
  final String username;
  final String image;
  final double size;
  final String? account;
  final Color? primaryColor;
  final Color? secondaryColor;
  final int? transactionTotal;
  final int? transactionCompleted;
  final bool expanded;
  final TransactionInput? transaction;
  const UserProfileTile(
      {super.key,
      required this.username,
      required this.image,
      this.account,
      this.primaryColor,
      this.secondaryColor,
      required this.expanded,
      this.transaction,
      this.transactionTotal,
      this.transactionCompleted,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserImage(
              image: image,
              size: size,
            ),
            const SizedBox(width: AppSize.s4),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        color: primaryColor ?? AppColor.fontGray,
                        fontSize: size / 3.3,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    transaction != null
                        ? Text(
                            '${parseDateTimeLapse(transaction!.createdAt)} ago',
                            style: TextStyle(
                              color: AppColor.gray,
                              fontSize: size / 4.3,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Container(),
                  ],
                ),
                transaction == null
                    ? Text(
                        account ?? '',
                        style: TextStyle(
                          color: secondaryColor ?? AppColor.gray,
                          fontSize: size / 3.3,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            getStatsIcon(transaction!.status),
                            height: size / 3,
                            width: size / 3,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Transaction ${getStatsTitle(transaction!.status)}',
                            style: TextStyle(
                              color: AppColor.gray,
                              fontSize: size / 4.3,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ],
        ),
        !expanded ? Container() : const SizedBox(height: 4),
        !expanded
            ? Container()
            : SizedBox(
                width: double.infinity,
                child: Text(
                  transactionCompleted == null && transactionTotal == null
                      ? "0 Transaction - 0% completion rate"
                      : '$transactionTotal Trades - ${(transactionCompleted! / transactionTotal!)}% completion rate',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 12,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
      ],
    );
  }
}
