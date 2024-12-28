import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class NoticeTile extends StatelessWidget {
  final Text? richText; 
  final double width;
  const NoticeTile({super.key, this.richText, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: AppColor.pink,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.70, 
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
                  child: richText?? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sarah Doe believes that ',
                          style: TextStyle(
                            color: AppColor.amber,
                            fontSize: 14,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Chelsea will beat Man UTD. ',
                          style: TextStyle(
                            color: AppColor.amber,
                            fontSize: 14,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Accepting the Wager means you disagree with this assertion ',
                          style: TextStyle(
                            color: AppColor.amber,
                            fontSize: 14,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}