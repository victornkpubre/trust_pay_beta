import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/indicators/payee_payment_indicator.dart';
import '../../../../../../../components/list_iems/user_profile_status_list_item.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../../components/style/text.dart';
import '../../../../../../domain/entities/base/entities.dart';
import '../../../../../../domain/entities/transaction/entities.dart';

Widget BillSplitterDetails(
    {required double width,
      required int paid,
      required int total,
      required Transaction transaction}) {
  final shares = transaction.obligations.where((o) => o.type == ObligationType.payment).toList();
  final bill = transaction.bill;

  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      PayeePaymentIndicator(
          paymentFulfilled: paid,
          width: width,
          paymentsTotal: total,
          payee: bill?.billerName ?? 'No bill selected'),
      if (bill != null) ...[
        const SizedBox(height: AppSize.s8),
        BillCard(bill: bill),
      ],
      const SizedBox(height: AppSize.s16),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Contributors: ${shares.length}')),
      Divider(thickness: 1, color: AppColor.lightGray, height: 0),
      Expanded(
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: shares.map((share) {
                  final member = transaction.members.where((m) => m.id == share.binding).firstOrNull;
                  if (member == null) return Container();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(thickness: 1, color: AppColor.lightGray, height: 0),
                      const SizedBox(height: AppSize.s8),
                      UserProfileStatusListItem(
                        user: member.toUserInput(),
                        amount: share.amount,
                        currency: transaction.currency,
                        obligationStatus: share.status,
                        textColor: AppColor.darkGray,
                        onDelete: () {},
                      ),
                      const SizedBox(height: AppSize.s8),
                    ],
                  );
                }).toList())),
      ),
    ],
  );
}

/// The bill a bill split pays: who, which customer number, whether it has
/// been paid, and the token for prepaid bills.
class BillCard extends StatelessWidget {
  final TransactionBill bill;
  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    final statusColor = bill.isPaid ? AppColor.green : bill.isFailed ? AppColor.red : AppColor.amber;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.s10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lightGray),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(bill.billerName, style: appTextBlack16Bold)),
          Text(bill.statusLabel, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
        ]),
        if (bill.paymentItemName != null) Text(bill.paymentItemName!, style: appTextGray14),
        const SizedBox(height: AppSize.s4),
        Text('${bill.customerFieldLabel ?? 'Customer'}: ${bill.customerId}', style: appTextGray14),
        if (bill.customerName != null) Text(bill.customerName!, style: appTextGray14),
        if (bill.token != null) ...[
          const SizedBox(height: AppSize.s8),
          Text('Token / PIN', style: appTextGray12),
          Row(children: [
            Expanded(child: SelectableText(bill.token!, style: appTextBlack16Bold)),
            IconButton(
              icon: const Icon(Icons.copy, size: AppSize.s16),
              onPressed: () => Clipboard.setData(ClipboardData(text: bill.token!)),
            ),
          ]),
        ],
        if (bill.isFailed && bill.responseDescription != null)
          Text(bill.responseDescription!, style: appTextGray12),
      ]),
    );
  }
}
