import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/base/base.dart';
import '../../../../../../../components/indicators/payee_user_indicator.dart';
import '../../../../../../../components/list_iems/user_profile_status_list_item.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../../components/style/text.dart';
import '../../../../../../domain/entities/entities.dart';
import '../transaction_details_section.dart';

Widget MoneyPoolDetails(
    {required double width,
      required Transaction transaction,
      required List<bool> payoutVisibility,
      required Function(int) onVisibilityToggle}) {
  List<Obligation> payoutObligations = transaction.obligations.where((o) {
    if (o.type == ObligationType.payout) {
      return true;
    } else {
      return false;
    }
  }).toList();

  List<List<Obligation>> listOfContributorsPerMonth = [];
  for (Obligation obligaton in payoutObligations) {
    List<Obligation> obligations = transaction.obligations.where((o) {
      if (o.dueDate.compareTo(obligaton.dueDate) == 0 &&
          o.type == ObligationType.payment) {
        return true;
      } else {
        return false;
      }
    }).toList();

    listOfContributorsPerMonth.add(obligations);
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: AppSize.s16),
      Text('Next Harvester', style: appTextGray16),
      const SizedBox(height: AppSize.s8),
      PayeeUserIndicator(
        date: transaction.expiryDate,
        group: false,
        amount: transaction.total,
        percentageCompletion: transaction.percentageComplete / 100,
        width: width,
        users: transaction.members.map((t) => t.toUserInput()).toList(),
      ),
      const SizedBox(height: AppSize.s16),
      Text('Details', style: appTextGray16Bold),
      const SizedBox(height: 8),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                      children: payoutObligations.map((o) {
                        int index = payoutObligations.indexOf(o);
                        return InkWell(
                            onTap: () {
                              onVisibilityToggle(index);
                            },
                            child: Column(
                              children: [
                                Divider(height: 1, thickness: 2, color: AppColor.lightGray),
                                buildPayoutTile(
                                    transaction,
                                    o,
                                    listOfContributorsPerMonth[index],
                                    payoutVisibility[index]),
                              ],
                            ));
                      }).toList()),
                  Divider(height: 0, thickness: 2, color: AppColor.lightGray),
                ],
              )))
    ],
  );
}
