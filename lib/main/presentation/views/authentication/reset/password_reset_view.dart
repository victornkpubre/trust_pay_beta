import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

enum UiState { requesting, verifying, resetting }

class PasswordResetView extends StatefulWidget {
  static const String routeName = '/auth/password/reset';

  const PasswordResetView({super.key});

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  final UiState state = UiState.resetting;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: AppSize.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppBackButton(size: AppSize.s16),
                    const SizedBox(width: AppSize.s16),
                    Expanded(
                        child: Text(
                      getTitle(state),
                      style: appTextBlack20Bold,
                    )),
                  ],
                ),
                const SizedBox(height: AppSize.s16),
                Text(getDescription(state),
                    style: appTextGray18, overflow: TextOverflow.visible),
                const SizedBox(height: AppSize.s32),
                state == UiState.requesting
                    ? AppTextInput(
                        title: "Email",
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        hint: 'johndoe@yahoo.com')
                    : Container(),
                state == UiState.requesting
                    ? const SizedBox(height: AppSize.s16)
                    : Container(),
                state == UiState.verifying
                    ? AppTextInput(
                        title: "Otp Code",
                        type: TextInputType.name,
                        controller: otpController,
                        hint: '')
                    : Container(),
                state == UiState.verifying
                    ? const SizedBox(height: AppSize.s16)
                    : Container(),
                state == UiState.resetting
                    ? AppTextInput(
                        title: "Enter Password",
                        type: TextInputType.visiblePassword,
                        controller: passwordController,
                        hint: '')
                    : Container(),
                state == UiState.resetting
                    ? const SizedBox(height: AppSize.s16)
                    : Container(),
                state == UiState.resetting
                    ? AppTextInput(
                        title: "Confirm Password",
                        type: TextInputType.visiblePassword,
                        controller: passwordConfirmationController,
                        hint: '')
                    : Container(),
                state == UiState.resetting
                    ? const SizedBox(height: AppSize.s16)
                    : Container(),
                const SizedBox(height: AppSize.s32),
                PrimaryButton(title: 'Continue', onTap: () {})
              ],
            ),
          ),
        ));
  }

  String getTitle(UiState state) {
    switch (state) {
      case UiState.requesting:
        return "Forgot Your Password?";
      case UiState.resetting:
        return "Enter New Password";
      case UiState.verifying:
        return "Enter Otp";
      default:
        return "Reset Password";
    }
  }
}

String getDescription(UiState state) {
  switch (state) {
    case UiState.requesting:
      return "Please enter the email address associated with your TrustPay account.";
    case UiState.resetting:
      return "Your Otp has been confirmed. Please create a new password.";
    case UiState.verifying:
      return "An Otp was sent the provided email address. Please enter the Otp below.";
    default:
      return "Reset Password";
  }
}
