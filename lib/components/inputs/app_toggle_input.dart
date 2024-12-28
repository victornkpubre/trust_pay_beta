import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class AppToggle extends StatefulWidget {
  final Function(bool) onToogle;
  const AppToggle({super.key, required this.onToogle});

  @override
  State<AppToggle> createState() => _AppToggleState();

}

class _AppToggleState extends State<AppToggle> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          state = !state;
        });
        widget.onToogle(state);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        width: AppSize.s48,
        decoration: BoxDecoration (
          color: state? AppColor.lightGray: AppColor.primary,
          borderRadius: BorderRadius.circular(AppSize.s16)
        ),
        child: Align(
          alignment: state? Alignment.centerLeft: Alignment.centerRight,
          child: Container(
            width: AppSize.s24,
            height: AppSize.s24,
            decoration: BoxDecoration( 
              color: AppColor.white, 
              shape: BoxShape.circle, 
            ),
          ),
        ),
      ),
    );
  }
}