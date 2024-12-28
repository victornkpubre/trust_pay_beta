import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/data_cards/completeion_rate_widget.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class UserTransactionInfoCard extends StatelessWidget {
  final TransactionType type;
  final String username;
  final String profileImage;
  final int amount;
  final double width;
  final double percentageComplete;
  final bool loading;
  const UserTransactionInfoCard(
      {super.key,
      required this.type,
      required this.username,
      required this.amount,
      required this.profileImage,
      required this.width,
      required this.percentageComplete, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 16),
              child: Image.asset(
                  height: width / 5,
                  width: width / 5,
                  fit: BoxFit.fill,
                  getIcon(type)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: AppColor.pink.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Transaction Image
                  Row(
                    children: [
                      UserImage(
                        image: profileImage,
                        size: width / 8,
                      ),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: FontSize.s12,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              color: AppColor.lightPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                    height: width / 20,
                                    width: width / 20,
                                    getIcon(TransactionType.betsWagers)),
                                const SizedBox(width: 4),
                                Text(
                                  "$amount ${getTransactionName(type)}",
                                  style: const TextStyle(fontSize: FontSize.s10),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 16),

                  //Completion Rate
                  CompleteionRateWidget(
                    percentageComplete: percentageComplete,
                    size: width / 16,
                    expanded: false,
                  )
                ],
              ),
            ),
          ),

          loading? Positioned.fill(
              child: Shimmer.fromColors(
                baseColor: AppColor.whiteSecondary,
                highlightColor: AppColor.white,
                child: Container(
                  decoration: ShapeDecoration(
                    color: AppColor.lightGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              )
          ): Container()
        ],
      ),
    );
  }
}
