import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_dropdown_input.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input.dart';
import 'package:trust_pay_beta/components/inputs/app_textarea_input_secondary.dart';
import 'package:trust_pay_beta/components/inputs/app_toggle_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';


class FormInputs extends StatefulWidget {
  const FormInputs({super.key});

  @override
  State<FormInputs> createState() => _FormInputsState();
}

class _FormInputsState extends State<FormInputs> {
  bool showWidget = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

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
                  Text("Form Inputs",
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
                    children: [
                      Text("AppTextInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppTextInput(
                    title: "Username",
                    hint: "Enter username",
                    controller: controller,
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppSelectInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppSelectInput(
                      width: MediaQuery.of(context).size.width,
                      title: "Add Seller",
                      hint: "Select User",
                      menuList: const [
                        'User 1',
                        'User 2',
                        'User 3',
                        'User 4',
                      ],
                      onSelect: (selection) {}),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppDateInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppDateInput(
                    title: "Expiry Date",
                    onDateSelected: (date) {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppSecondaryTextInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppSecondaryTextInput(
                      width: MediaQuery.of(context).size.width,
                      controller: controller,
                      hint: "Enter Obligation"),
                  const SizedBox(height: 32),
                  AppSecondaryTextInput(
                      width: MediaQuery.of(context).size.width,
                      controller: controller,
                      hint: "Enter Amount",
                      type: TextInputType.number),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppSecondarySelectInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const AppSecondarySelectInput(
                    hint: "Choose a Bank",
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppTextAreaInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppTextAreaInput(
                    hint: "Enter Obligation Details",
                    controller: controller,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppSecondaryTextAreaInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppSecondaryTextAreaInput(
                    title: "Account Number",
                    hint: "00000000000",
                    controller: controller,
                    isCardNumberInput: true,
                    limit: 11,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppToggle", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppToggle(
                    onToogle: (value) {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppDropDownInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const AppDropDownInput(
                      items: ['String', 'User2', 'User 4'],
                      title: 'title',
                      initialValue: 'select'),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("AppSecondaryDropDownInput",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppSecondaryDropDownInput(
                      width: MediaQuery.of(context).size.width,
                      onSelect: (item){},
                      items: const [
                        'Split Bill Equally',
                        'Split Bill by Percentage',
                        'Split Bill Manually'
                      ]),
                  const SizedBox(height: 32),
                ],
              )
            : Container(),
      ],
    );
  }
}
