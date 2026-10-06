import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class AppToggle extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onToggle;
  const AppToggle({
    super.key,
    required this.onToggle,
    required this.initialValue
  });

  @override
  State<AppToggle> createState() => _AppToggleState();

}

class _AppToggleState extends State<AppToggle> {
  late bool state;
  @override
  void initState() {
    state = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          state = !state;
        });
        widget.onToggle(state);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        width: AppSize.s48,
        decoration: BoxDecoration (
          color: state? AppColor.primary: AppColor.lightGray,
          borderRadius: BorderRadius.circular(AppSize.s16)
        ),
        child: Align(
          alignment: state? Alignment.centerRight: Alignment.centerLeft,
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