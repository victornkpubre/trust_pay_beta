import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/data_cards/completeion_rate_widget.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/tiles/status_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_members_tile.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class UserTransactionDetailsCard extends StatelessWidget {
  final String title;
  final double width;
  final TransactionStatus status;
  final double percentageComplete;
  final String amount;
  final DateTime createdAt;
  final DateTime? nextHarvestDate;
  final List<UserInput> members;
  const UserTransactionDetailsCard(
      {super.key,
      required this.title,
      required this.status,
      required this.amount,
      this.nextHarvestDate,
      required this.members,
      required this.createdAt,
      required this.percentageComplete,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(AppSize.s16),
        decoration: BoxDecoration(
            color: AppColor.smokeWhite,
            border: Border.all(color: AppColor.borderGray),
            borderRadius: BorderRadius.circular(AppSize.s16),
            boxShadow: [boxShadowOne]),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.fontGray),
                    ),
                  ),
                  const SizedBox(width: AppSize.s16),
                  StatusTile(
                    status: status,
                    size: width / 32,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Transaction Image
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${members.length} contributors",
                          style: TextStyle(
                              fontSize: AppSize.s10, color: AppColor.fontGray),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TransactionMembersTile(
                                  iconSize: width / 8,
                                  members: members),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Created: ${parseDateSecondary(createdAt)}",
                          style: TextStyle(
                              fontSize: AppSize.s10, color: AppColor.amber),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),

                  //Completion Rate
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CompleteionRateWidget(
                                percentageComplete: percentageComplete,
                                size: width / 16,
                                expanded: false),
                            const SizedBox(height: 4),
                            Text(
                              AppString.naira + amount,
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: FontSize.s14,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        nextHarvestDate != null
                            ? Text(
                                "Next Harvest ${parseDateSecondary(nextHarvestDate!)}",
                                style: TextStyle(
                                    fontSize: FontSize.s10,
                                    color: AppColor.gray),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
