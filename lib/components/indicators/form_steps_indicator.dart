import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class FormStepsIndicator extends StatefulWidget {
  final int steps;
  final double fontSize;
  final double width;
  const FormStepsIndicator({super.key, required this.steps, required this.fontSize, required this.width});

  @override
  State<FormStepsIndicator> createState() => _FormStepsIndicatorState();
}

class _FormStepsIndicatorState extends State<FormStepsIndicator> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Step ${currentStep+1}/${widget.steps}',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColor.fontGray,
              fontSize: widget.fontSize,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildBars(widget.steps, currentStep),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  next(){
    setState(() {
      if(currentStep > 0) currentStep--;
    });
  }

  prev() {
    setState(() {
      if(currentStep < widget.steps) currentStep++;
    });
  }
}

_buildBars(int steps, int currentStep){
  List<Widget> list= [];

  for (var i = 0; i < steps; i++) {
    list.add(
      Expanded(
        child: Container(
          height: 6,
          decoration: ShapeDecoration(
            color: i == currentStep? AppColor.primary: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );

    if(i < steps){
      list.add(const SizedBox(width: 4));
    }
  }

  return list;
}