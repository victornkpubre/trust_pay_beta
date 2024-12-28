import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/texts/status_text.dart';
import 'package:trust_pay_beta/components/texts/transaction_card_subtitle.dart';
import 'package:trust_pay_beta/components/tiles/transaction_members_tile.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionDetailsCard extends StatefulWidget {
  final double width;
  final String title;
  final TransactionType type;
  final TransactionStatus status;
  final String amount;
  final DateTime date;
  final List<UserInput> members;
  const TransactionDetailsCard(
      {super.key,
      required this.title,
      required this.type,
      required this.status,
      required this.amount,
      required this.date,
      required this.members,
      required this.width});

  @override
  State<TransactionDetailsCard> createState() => _TransactionDetailsCardState();
}

class _TransactionDetailsCardState extends State<TransactionDetailsCard> {
  bool expanded = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(AppSize.s14),
      decoration: ShapeDecoration(
        color: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        shadows: [boxShadowThree],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (!expanded) {
              setState(() {
                expanded = true;
              });

              Timer(const Duration(seconds: 2), () {
                setState(() {
                  expanded = false;
                });
              });
            }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(AppSize.s64),
                      ),
                    ),
                    child: SizedBox(
                        height: widget.width / 10,
                        width: widget.width / 10,
                        child: Image.asset(getIcon(widget.type)))),
                const SizedBox(width: AppSize.s4),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widget.width/2,
                        child: Text(
                          widget.title,
                          overflow: expanded? TextOverflow.visible: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: FontSize.s18,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s4),
                      Text(
                        widget.amount,
                        style: TextStyle(
                          color: AppColor.amber,
                          fontSize: FontSize.s16,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: AppColor.lightGray),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.members.isNotEmpty?
                      _buildSubTitle(widget.type, widget.members, FontSize.s14):
                        Container(),
                    const SizedBox(height: AppSize.s8),
                    Row(
                      children: [
                        Expanded(
                          child: TransactionMembersTile(
                              iconSize: widget.width / 10,
                              members: widget.members
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildStatusSection(widget.width, widget.status),
                    const SizedBox(height: AppSize.s4),
                    _buildExpirationDateSection(widget.date),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_buildStatusSection(width, status) {
  return StatusText(status: status, fontSize: width / 24);
}

_buildExpirationDateSection(date) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        'Expires',
        style: TextStyle(
          color: AppColor.lightGray,
          fontSize: FontSize.s12,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        parseDate(date),
        style: TextStyle(
          color: AppColor.white,
          fontSize: FontSize.s12,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

_buildSubTitle(TransactionType type, List<UserInput> members, fontSize) {
  switch (type) {
    case TransactionType.moneyPool:
      return TransactionCardSubtitle(
          fontSize: fontSize,
          text1: "Money Pool with ",
          text2: members.length.toString(),
          text3: " People");
    case TransactionType.betsWagers:
      return TransactionCardSubtitle(
        fontSize: fontSize,
        text1: "Wager with ",
        text2: members[0].username,
      );
    case TransactionType.secureSales:
      return TransactionCardSubtitle(
        fontSize: fontSize,
        text1: "Sales with ",
        text2: members[0].username,
      );
    case TransactionType.billSplitter:
      return TransactionCardSubtitle(
          fontSize: fontSize,
          text1: "Split Between ",
          text2: members.length.toString(),
          text3: " People");
    case TransactionType.groupGoals:
      return TransactionCardSubtitle(
          fontSize: fontSize,
          text1: "Goal between ",
          text2: (members.length).toString(),
          text3: " People");
    default:
      return TransactionCardSubtitle(
          fontSize: fontSize,
          text1: "Money Pool with",
          text2: members.length.toString(),
          text3: "People"
      );
  }
}
