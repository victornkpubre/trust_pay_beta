import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/base/base.dart';
import '../../../../../../../components/indicators/amount_indicator.dart';
import '../../../../../../../components/list_iems/user_profile_status_list_item.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../../components/style/text.dart';
import '../../../../../../domain/entities/base/entities.dart';
import '../../../../../../domain/entities/transaction/entities.dart';
import '../../../../../../domain/entities/user/entities.dart';


Widget GroupGoalDetails(
    {required double width,
      required Transaction transaction,
      required List<bool> fulfilmentVisibilities,
      required Function(int) onVisibilityToggle}) {
  List<List<Obligation>> listOfContributorsPerMonth = [];
  Set<DateTime> fulfilmentDates = {};
  for (var obligation in transaction.obligations) {
    fulfilmentDates.add(obligation.dueDate);
  }

  for (var date in fulfilmentDates) {
    List<Obligation> obligations = transaction.obligations.where((o) {
      if (o.dueDate.compareTo(date) == 0 && o.type == ObligationType.payment) {
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
      Text('Amount Accured', style: appTextGray16Bold),
      const SizedBox(height: AppSize.s8),
      AmountIndicator(
          amount: transaction.total,
          width: width,
          percentageComplete: transaction.percentageComplete / 100
      ),
      const SizedBox(height: AppSize.s16),
      Text('Monthly Fulfilment', style: appTextGray16Bold),
      const SizedBox(height: 8),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                      children: fulfilmentDates.map((date) {
                        int index = fulfilmentDates.toList().indexOf(date);
                        return InkWell(
                            onTap: () {
                              onVisibilityToggle(index);
                            },
                            child: Column(
                              children: [
                                Divider(height: 1, thickness: 2, color: AppColor.lightGray),
                                _buildFulfilmentTile(
                                    transaction,
                                    date,
                                    listOfContributorsPerMonth[index],
                                    fulfilmentVisibilities[index]),
                              ],
                            ));
                      }).toList()),
                  Divider(height: 0, thickness: 2, color: AppColor.lightGray),
                ],
              )))
    ],
  );
}


Widget _buildFulfilmentTile(Transaction transaction, DateTime date,
    List<Obligation> obligations, bool expanded) {
  return Container(
    color: expanded ? AppColor.lightGray : null,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        !expanded ? const SizedBox(height: AppSize.s16) : Container(),
        Container(
          padding: expanded
              ? const EdgeInsets.only(
            top: AppSize.s4,
            right: AppSize.s8,
            left: AppSize.s8,
          )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppSize.s24,
                    height: AppSize.s24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: totalObligationStatusPerMonth(
                              date: date, obligations: obligations) ==
                              ObligationStatus.paid
                              ? AppColor.green
                              : null,
                          borderRadius: BorderRadius.circular(AppSize.s24),
                          border: Border.all(
                              color: totalObligationStatusPerMonth(
                                  date: date,
                                  obligations: obligations) ==
                                  ObligationStatus.paid
                                  ? AppColor.green
                                  : AppColor.amber,
                              width: 2)),
                      child: totalObligationStatusPerMonth(
                          date: date, obligations: obligations) ==
                          ObligationStatus.paid
                          ? Icon(Icons.check,
                          size: AppSize.s16, color: AppColor.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  Text(parseDateMonthYear(date), style: appTextGray16)
                ],
              ),
              Icon(
                  expanded
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleRight,
                  size: AppSize.s16)
            ],
          ),
        ),
        !expanded ? const SizedBox(height: AppSize.s16) : Container(),
        !expanded
            ? Container()
            : Column(
          children: [
            const SizedBox(height: AppSize.s8),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Column(
                children: [
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text('Harvester')
                  // ),
                  // UserProfileStatusListItem(
                  //   user: payee.payee!.toUserInput(),
                  //   amount: payee.amount,
                  //   obligationStatus: payee.status,
                  //   textColor: AppColor.darkGray,
                  //   onDelete: () {},
                  // ),
                  // const SizedBox(height: AppSize.s16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Contributors')),
                  Column(
                    children: obligations.map((obligation) {
                      User binding = transaction.members
                          .firstWhere((t) => t.id == obligation.binding);
                      return obligation.binding == null
                          ? Container()
                          : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserProfileStatusListItem(
                            user: binding.toUserInput(),
                            textColor: AppColor.darkGray,
                            amount: obligation.amount,
                          ),
                          const SizedBox(height: AppSize.s16),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSize.s8),
          ],
        ),
      ],
    ),
  );
}

ObligationStatus totalObligationStatusPerMonth(
    {required List<Obligation> obligations, required DateTime date}) {
  ObligationStatus status = ObligationStatus.paid;
  List<Obligation> obligationsDateFiltered =
  obligations.where((o) => o.dueDate.compareTo(date) == 0).toList();

  for (var o in obligationsDateFiltered) {
    if (o.status == ObligationStatus.pending) {
      return ObligationStatus.pending;
    }
  }

  return status;
}
