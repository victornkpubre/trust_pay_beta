import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/texts/obligation_status_text.dart';
import 'package:trust_pay_beta/components/texts/status_text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionObligationItem extends StatelessWidget {
  final double size;
  final String title;
  final double amount;
  final DateTime? date;
  final TransactionInput? transaction;
  final ObligationStatus? obligationStatus;
  const TransactionObligationItem(
      {super.key,
      required this.title,
      required this.amount,
      this.transaction,
      this.date,
      this.obligationStatus,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Container(
                width: size,
                height: size,
                padding: EdgeInsets.all(size/3.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: obligationStatus == null && transaction != null
                        ? getBackgroundColor(transaction!.status)
                        : getObligationBackgroundColor(obligationStatus!)),
                child: SvgPicture.asset(obligationStatus == null && transaction != null
                    ? getStatsIcon(transaction!.status)
                    : getObligationStatusIcon(obligationStatus!)),
              ),
              const SizedBox(width: AppSize.s16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 16),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.fontGray,
                          fontSize: size / 2.8,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child:  transaction == null
                          ? Text(
                              parseDate(date??DateTime.now()),
                              style: TextStyle(
                                color: AppColor.gray,
                                fontSize: size / 3.5,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Row(
                              children: [
                                Image.asset(getIcon(transaction!.type),
                                    height: size / 2.5, width: size / 2.5),
                                const SizedBox(width: 4),
                                Text(
                                  getTitle(transaction!.type),
                                  style: TextStyle(
                                    color: AppColor.grayAccent,
                                    fontSize: size / 3.5,
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    parseAmountDouble(amount),
                    style: TextStyle(
                      color: AppColor.fontGray,
                      fontSize: size / 3,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  obligationStatus == null && transaction != null?
                    StatusText(
                      status: transaction!.status,
                      fontSize: size / 3.3,
                    )
                    : ObligationStatusText(status: obligationStatus??ObligationStatus.pending, fontSize: AppSize.s18)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
