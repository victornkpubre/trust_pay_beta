import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class FormIndicator extends StatelessWidget {
  final int steps;
  final int currentStep;
  final double width;
  const FormIndicator(
      {super.key,
      required this.steps,
      required this.currentStep,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s4),
            child: Row(
              children: [
                AppBackButton(size: AppSize.s16),
              ],
            )),
        Positioned.fill(
            child: Center(
          child: SizedBox(
              width: width / 2.5,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        steps,
                        (index) => Expanded(
                              child: Row(
                                children: [
                                  const SizedBox(width: AppSize.s4),
                                  Expanded(
                                    child: Container(
                                      height: AppSize.s4,
                                      decoration: BoxDecoration(
                                          color: currentStep == index
                                              ? AppColor.primary
                                              : AppColor.lightGray,
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s8)),
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.s4)
                                ],
                              ),
                            )),
                  ),
                ],
              )),
        )),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Center(
            child: Text(
              'Step ${currentStep + 1}/$steps',
              style: appTextBlack16Bold,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
