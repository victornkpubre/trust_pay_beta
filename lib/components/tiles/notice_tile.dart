import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class NoticeTile extends StatelessWidget {
  final Text richText;
  final double width;
  const NoticeTile({super.key, required this.richText, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: AppColor.pink,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColor.amber
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.circleExclamation,
            color: AppColor.amber,
            size: 16,
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: richText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}