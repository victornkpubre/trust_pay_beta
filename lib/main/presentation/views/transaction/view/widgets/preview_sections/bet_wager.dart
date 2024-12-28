import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/tiles/source_of_truth_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';


BetWagerPreview({
  required double width,
  required TransactionDetailsViewState state,
  required String username,
  required DateTime date,
  required Mediation mediation
}) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SourceOfTruthTile(url: mediation.getUrl()!, details: mediation.details),
                ],
              ),

              state == TransactionDetailsViewState.acceptance? Column(
                children: [
                  const SizedBox(height: AppSize.s32),
                  Divider(height: 0, color: AppColor.lightGray, thickness: AppSize.s4),
                  const SizedBox(height: AppSize.s32),
                  NoticeTile(
                    width: width,
                    richText: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: username,
                                style: TextStyle(
                                  color: AppColor.amber,
                                  fontSize: 14,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'believes that ',
                                style: TextStyle(
                                  color: AppColor.amber,
                                  fontSize: 14,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: mediation.details,
                                style: TextStyle(
                                  color: AppColor.amber,
                                  fontSize: 14,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '. Accepting the transaction means you disagree with $username and are willing to bet agaist him/her ',
                                style: TextStyle(
                                  color: AppColor.amber,
                                  fontSize: 14,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]
                        )
                    ),
                  ),
                ],
              ): Container(),

              state == TransactionDetailsViewState.payment? Column(
                children: [
                  const SizedBox(height: AppSize.s16),
                  Divider(height: 0, color: AppColor.lightGray, thickness: AppSize.s4),
                  const SizedBox(height: AppSize.s16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Settelment Date', style: appTextGray18),
                          const SizedBox(height: AppSize.s4),
                          Text(parseDate(date), style: appTextPurple18Bold),
                        ],
                      ),
                    ],
                  ),
                ],
              ): Container()

            ],
          )
      ),
    ],
  );
}
