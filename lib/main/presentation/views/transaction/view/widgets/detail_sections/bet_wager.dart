import 'package:flutter/material.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/base/base.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../../components/style/text.dart';
import '../../../../../../../components/tiles/countdown_tile.dart';
import '../../../../../../../components/tiles/source_of_truth_tile.dart';


Widget BetWagerDetails(
    {required double width,
      required String url,
      required String details,
      required String username,
      required DateTime date}) {
  return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
      child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SourceOfTruthTile(url: url, details: details),
                ],
              ),
              const SizedBox(height: AppSize.s32),
              Divider(
                  color: AppColor.lightGray, height: 0, thickness: AppSize.s4),
              const SizedBox(height: AppSize.s32),
              CountdownTile(
                width: width / 2,
                days: DateTime.now().difference(date).inDays,
                hours: DateTime.now().difference(date).inHours % 24,
                minutes: DateTime.now().difference(date).inMinutes % 60,
              ),
              const SizedBox(height: AppSize.s32),
              Text('Settelment Date', style: appTextGray18),
              Text(parseDate(date), style: appTextPurple18Bold),
            ],
          )));
}
