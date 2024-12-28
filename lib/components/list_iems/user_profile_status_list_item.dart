import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/texts/obligation_status_text.dart';
import 'package:trust_pay_beta/components/texts/status_text.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class UserProfileStatusListItem extends StatefulWidget {
  final UserInput user;
  final double amount;
  final Color textColor;
  final TransactionStatus? transactionStatus;
  final ObligationStatus? obligationStatus;
  final Function? onDelete;

  const UserProfileStatusListItem(
      {super.key,
      required this.user,
      required this.amount,
      required this.textColor,
      this.onDelete, 
      this.transactionStatus, 
      this.obligationStatus
    });

  @override
  State<UserProfileStatusListItem> createState() =>
      _UserProfileStatusListItemState();
}

class _UserProfileStatusListItemState extends State<UserProfileStatusListItem> {
  bool deleting = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: UserProfileTile(
              size: AppSize.s40,
              username: widget.user.username,
              account: widget.user.account,
              image: widget.user.image,
              expanded: false),
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: deleting ? null : 0,
          decoration: ShapeDecoration(
              color: AppColor.lightRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s18),
              )),
          padding: const EdgeInsets.symmetric(
              vertical: AppSize.s8, horizontal: AppSize.s16),
          child: InkWell(
            onTap: () {
              widget.onDelete!();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.trashCan,
                    color: AppColor.white, size: AppSize.s16),
                const SizedBox(width: AppSize.s4),
                Text('Delete', style: appTextWhite14Bold),
              ],
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (!deleting) {
              setState(() {
                deleting = true;
              });

              Timer(const Duration(seconds: 2), () {
                setState(() {
                  deleting = false;
                });
              });
            }
          },
          child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: !deleting ? null : 0,
              child: deleting
                  ? Container()
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          parseAmountDouble(widget.amount),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: FontSize.s16,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                        widget.transactionStatus != null? StatusText(
                          status: widget.transactionStatus!, 
                          fontSize: FontSize.s12
                        ): Container(),
                        widget.obligationStatus != null? ObligationStatusText(
                          status: widget.obligationStatus!, 
                          fontSize: FontSize.s12
                        ): Container()
                      ],
                    )),
        )
      ],
    );
  }
}
