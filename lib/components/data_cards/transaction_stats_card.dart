import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/data_cards/completeion_rate_widget.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionStatsCard extends StatelessWidget {
  final double width;
  final double percentageComplete;
  final int transactions;
  final int successful;
  final int pending;
  final TransactionType type;
  const TransactionStatsCard(
      {super.key,
      required this.width,
      required this.percentageComplete,
      required this.type,
      required this.transactions,
      required this.successful,
      required this.pending, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: AppColor.borderGray,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [boxShadowTwo],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Transaction Image
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width / 6,
                          height: width / 6,
                          decoration: ShapeDecoration(
                            color: AppColor.lightPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  getIcon(TransactionType.billSplitter),
                                  height: width / 8,
                                  width: width / 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          getTitle(type),
                          style: TextStyle(
                            color: AppColor.fontGray,
                            fontSize: width / 32,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    
                //Completion Rate
                CompleteionRateWidget(
                  size: width / 12,
                  percentageComplete: percentageComplete,
                  expanded: true,
                )
              ],
            ),
          ),
          SizedBox(height: 30),
    
          //Stats
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: StatsButton(
                  title: "Transaction",
                  value: transactions,
                  fontSize: width / 35,
                  fontColor: AppColor.fontGray,
                  color: AppColor.lightGray,
                  stats: TransactionStatus.accepted,
                )),
                const SizedBox(width: AppSize.s8),
                Expanded(
                    child: StatsButton(
                  title: "Successful",
                  fontColor: AppColor.green,
                  fontSize: width / 32,
                  value: successful,
                  color: AppColor.lightGreen,
                  stats: TransactionStatus.completed,
                )),
                const SizedBox(width: AppSize.s8),
                Expanded(
                    child: StatsButton(
                  title: "Pending",
                  fontColor: AppColor.amber,
                  fontSize: width / 32,
                  value: pending,
                  color: AppColor.redAccent,
                  stats: TransactionStatus.pending,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsButton extends StatelessWidget {
  final TransactionStatus stats;
  final Color color;
  final String title;
  final Color fontColor;
  final int value;
  final double fontSize;
  const StatsButton(
      {super.key,
      required this.stats,
      required this.color,
      required this.value,
      required this.title,
      required this.fontColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.s8),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.lightPurple),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  getStatsIcon(stats),
                ),
                const SizedBox(width: AppSize.s4),
                Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: appTextGray16Bold,
                ),
              ],
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
