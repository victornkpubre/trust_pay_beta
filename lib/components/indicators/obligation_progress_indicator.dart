import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class ObligationProgressIndicator extends StatelessWidget {
  final int paymentsFulfilled;
  final int obligationsFulfilled;
  final int obligationsTotal;
  final double fontSize;
  final double width;
  const ObligationProgressIndicator(
      {super.key,
      required this.fontSize,
      required this.width,
      required this.paymentsFulfilled,
      required this.obligationsTotal,
      required this.obligationsFulfilled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Obligation Fulfilled $obligationsFulfilled/$obligationsTotal',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColor.fontGray,
              fontSize: fontSize,
              fontFamily: 'Source Sans Pro',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildBars(obligationsTotal, obligationsFulfilled,
                obligationsTotal, paymentsFulfilled),
          ),
          const SizedBox(width: 8),
          Text(
            '$paymentsFulfilled out of $obligationsTotal payments made',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColor.fontGray,
              fontSize: fontSize - 1,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

_buildBars(int obligationTotal, int obligationFulfilled, int paymentTotal, int paymentFulfilled) {
  List<Widget> list = [];

  for (var i = 0; i < obligationTotal; i++) {
    Color color = AppColor.lightGray;

    if (i < obligationFulfilled) {
      color = AppColor.amber;
    }

    if (i < paymentFulfilled) {
      color = AppColor.green;
    }

    list.add(
      Expanded(
        child: Container(
          height: 6,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );

    if (i < obligationTotal) {
      list.add(const SizedBox(width: 4));
    }
  }

  return list;
}
