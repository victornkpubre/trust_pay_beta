import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/account_tile_primary.dart';

enum UiState { requesting, verifying, resetting }

class AccountView extends StatefulWidget {
  static const String routeName = '/account';

  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final UiState state = UiState.resetting;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: AppSize.s16),
                Stack(
                  children: [
                    const Positioned(
                        top: 4,
                        left: 8,
                        child: AppBackButton(size: AppSize.s16)),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Account',
                              style: appTextBlack24Bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s32),
                AccountCard(
                    balance: '200,000',
                    width: width,
                    height: width * 0.4,
                    solid: true),
                const SizedBox(height: AppSize.s32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Name', style: appTextGray16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Victor - Polaris Bank',
                            style: appTextBlack16Bold),
                        Text('Show Less', style: appTextPrimary16Bold),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: AppSize.s16),
                AccountTilePrimary(number: '234565433', width: width)
              ],
            ),
          ),
        ));
  }
}
