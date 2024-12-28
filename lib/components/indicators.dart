import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/indicators/form_indicator.dart';
import 'package:trust_pay_beta/components/indicators/form_steps_indicator.dart';
import 'package:trust_pay_beta/components/indicators/obligation_progress_indicator.dart';
import 'package:trust_pay_beta/components/indicators/payee_payment_indicator.dart';
import 'package:trust_pay_beta/components/indicators/payee_user_indicator.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';

class Indicators extends StatefulWidget {
  const Indicators({super.key});

  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  bool showWidget = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                showWidget = !showWidget;
              });
            },
            child: Container(
              color: showWidget ? AppColor.primary : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Indicators",
                      style: TextStyle(
                        fontSize: 32,
                        color: showWidget ? AppColor.white : Colors.black,
                      )),
                ],
              ),
            )),
        showWidget
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("FormStepsIndicator",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const FormStepsIndicator(
                    steps: 3,
                    fontSize: 12,
                    width: 200,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ObligationProgressIndicator",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const ObligationProgressIndicator(
                    fontSize: 14,
                    width: double.infinity,
                    obligationsFulfilled: 3,
                    obligationsTotal: 5,
                    paymentsFulfilled: 2,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("PayeePaymentIndicator",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  PayeePaymentIndicator(
                    width: MediaQuery.of(context).size.width,
                    payee: "The Place",
                    paymentFulfilled: 3,
                    paymentsTotal: 6,
                    // fontSize: 14,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("PayeeUserIndicator",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  PayeeUserIndicator(
                    width: MediaQuery.of(context).size.width,
                    group: true,
                    date: DateTime.now(),
                    amount: 323000.00,
                    percentageCompletion: 0.5,
                    users: [
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)
                    ],
                  ),
                  const SizedBox(height: 32),
                  PayeeUserIndicator(
                    width: MediaQuery.of(context).size.width,
                    group: false,
                    date: DateTime.now(),
                    amount: 323000.00,
                    percentageCompletion: 0.5,
                    users: [
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("FormIndicator",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  FormIndicator(
                    steps: 3,
                    currentStep: 0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 32),
                ],
              )
            : Container()
      ],
    );
  }
}
