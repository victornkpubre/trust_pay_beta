import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/list_iems/obligation_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';


SecureSalesPreview(List<ObligationInput> obligations) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Obligations', style: appTextGray16),
          Text('${obligations.where((o) => o.type==ObligationType.delivery).length}', style: appTextGray16),
        ],
      ),
      const SizedBox(height: AppSize.s8),
      Expanded(
        child: SingleChildScrollView(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: obligations.where((o) => o.type==ObligationType.delivery)
                .map((obligation) => obligation.type != ObligationType.delivery? Container(): Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                    thickness: 1,
                    color: AppColor.lightGray,
                    height: 0),
                const SizedBox(height: AppSize.s8),
                ObligationListItem(
                    title: obligation.title,
                    amount: obligation.amount,
                    dateTime: obligation.date),
                const SizedBox(height: AppSize.s8),
              ],
            ))
                .toList()),
        ),
      ),
    ],
  );
}