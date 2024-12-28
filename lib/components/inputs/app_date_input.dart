import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AppDateInput extends StatefulWidget {
  final String title;
  final Function(DateTime?) onDateSelected;
  const AppDateInput(
      {super.key, required this.title, required this.onDateSelected});

  @override
  State<AppDateInput> createState() => _AppDateInputState();
}

class _AppDateInputState extends State<AppDateInput> {
  DateTime? datetime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: appTextPrimary16Bold),
          const SizedBox(height: AppSize.s8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s16, vertical: AppSize.s14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColor.fontBlack,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColor.fontBlack),
                borderRadius: BorderRadius.circular(AppSize.s32),
              ),
              shadows: [boxShadowOne],
            ),
            child: InkWell(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2050));
                setState(() {
                  datetime = date;
                  widget.onDateSelected(date);
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                        datetime == null ? 'dd-mm-yyyy' : parseDate(datetime!),
                        style: appTextGray16),
                  ),
                  Icon(
                    FontAwesomeIcons.calendar,
                    size: FontSize.s16,
                    color: AppColor.darkGray,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
