import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/base.dart';

class ObligationListItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime dateTime;
  const ObligationListItem(
      {super.key,
      required this.title,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF00182D),
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Expiration Date",
                    style: TextStyle(
                      color: Color(0xFF9FA2AA),
                      fontSize: 14,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                parseAmountDouble(amount),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF00182D),
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                parseDate(dateTime),
                style: const TextStyle(
                  color: Color(0xFF9FA2AA),
                  fontSize: 14,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
