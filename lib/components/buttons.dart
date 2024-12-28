import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/buttons/add_btn.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/biometric_button.dart';
import 'package:trust_pay_beta/components/buttons/email_auth_btn.dart';
import 'package:trust_pay_beta/components/buttons/facebook_auth_btn.dart';
import 'package:trust_pay_beta/components/buttons/google_auth_btn.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/main_menu_button.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
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
                  Text("Buttons",
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
                      Text("GoogleAuthButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  GoogleAuthButton(
                    onTap: () {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("FacebookAuthButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  FacebookAuthButton(
                    onTap: () {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("EmailAuthButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  EmailAuthButton(onTap: () {}),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("BiometricsButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  BiometricsButton(title: "Login", onTap: () {}),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("PrimaryButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  PrimaryButton(title: "Accept Transaction", onTap: () {}),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("SecondaryButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  // const AlertButton(title: "Reject Transaction"),
                  // const SizedBox(height: 32),
                  SecondaryButton(title: "Accept Transaction", onTap: () {}),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("QuickMenuButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  QuickMenuButton(
                      color: AppColor.white,
                      onTap: () {},
                      type: TransactionType.secureSales,
                      size: MediaQuery.of(context).size.width / 4),
                  const SizedBox(height: 8),
                  QuickMenuButton(
                      color: AppColor.white,
                      onTap: () {},
                      type: TransactionType.billSplitter,
                      size: MediaQuery.of(context).size.width / 4),
                  const SizedBox(height: 8),
                  QuickMenuButton(
                      color: AppColor.white,
                      onTap: () {},
                      type: TransactionType.groupGoals,
                      size: MediaQuery.of(context).size.width / 4),
                  const SizedBox(height: 8),
                  QuickMenuButton(
                      color: AppColor.secondary,
                      onTap: () {},
                      type: TransactionType.moneyPool,
                      size: MediaQuery.of(context).size.width / 4),
                  const SizedBox(height: 8),
                  QuickMenuButton(
                      color: AppColor.secondary,
                      onTap: () {},
                      type: TransactionType.betsWagers,
                      size: MediaQuery.of(context).size.width / 4),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text("MainMenuButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  MainMenuButton(
                      size: 48,
                      padding: 8,
                      icon: SvgIconAssets.menu,
                      onTap: () {},
                      background: AppColor.primary),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text("AppBackButton",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppBackButton(
                    size: 18,
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text("AddButtton", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AddButtton(
                    title: "Add",
                    solid: true,
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AddButtton(
                    title: "Add Contributor",
                    solid: true,
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AddButtton(
                    title: "Add User",
                    solid: false,
                    onTap: () {},
                  ),
                  const SizedBox(height: 32),
                ],
              )
            : Container(),
      ],
    );
  }
}
