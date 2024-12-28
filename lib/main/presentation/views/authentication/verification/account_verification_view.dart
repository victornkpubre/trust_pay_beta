import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';


class AccountVerificationView extends StatefulWidget {
  static const String routeName = '/auth/verification';

  const AccountVerificationView({super.key});

  @override
  State<AccountVerificationView> createState() =>
      _AccountVerificationViewState();
}

class _AccountVerificationViewState extends State<AccountVerificationView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Container(
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
                              'Verify Account',
                              style: appTextBlack20Bold,
                            )),
                      ],
                    ),
                    const SizedBox(height: AppSize.s16),
                    Text('Please enter the opt code that was sent to ${state.user?.email}',
                        style: appTextGray18, overflow: TextOverflow.visible),
                    const SizedBox(height: AppSize.s32),
                    AppTextInput(
                        title: "Email",
                        type: TextInputType.emailAddress,
                        controller: controller,
                        hint: 'johndoe@yahoo.com'),
                    const SizedBox(height: AppSize.s16),
                    const SizedBox(height: AppSize.s32),
                    PrimaryButton(
                        title: 'Continue', onTap: () {}, active: true),
                    const SizedBox(height: AppSize.s24),
                    InkWell(
                      onTap: () => _resendOtp(),
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: FontSize.s16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "Didn't get OTP Code? ",
                              style: TextStyle(
                                color: AppColor.fontGray,
                              ),
                            ),
                            TextSpan(
                              text: 'Resend',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

_resendOtp() {}
