import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/biometric_button.dart';
import 'package:trust_pay_beta/components/buttons/email_auth_btn.dart';
import 'package:trust_pay_beta/components/buttons/google_auth_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/database.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/services/fcm_service.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/auth/auth_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import '../../../app/routes.dart';

class AuthView extends StatelessWidget {
  static const String routeName = '/auth';
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error) {
            showErrorSnackBar(
              context: context,
              message: state.errorMessage,
              onRetry: () => context.read<AuthBloc>().retry(),
            );
          }

          if (state.status == AuthStatus.authenticated) {
            //store backend auth token
            context.read<AppPreferences>().setAccessToken(state.token);

            //Load user data
            context.read<UserBloc>().add(UserEvent.loadUser(state.user!.id!, UserState()));
            context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(
                state.user!.id!, AppConstants.pageSize, 1, TransactionBlocState()));

            //init fcm
            FcmService.instance.setDeviceToken(context);

            Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              _buildBackGroundIllustration(width),
              Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.logoTitle,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: AppSize.s16),
                EmailAuthButton(onTap: () {
                  Navigator.pushNamed(context, Routes.emailAuthView);
                }),
                const SizedBox(height: AppSize.s32),
                BiometricsButton(onTap: () {
                  final db = AppDatabase.instance(); //This should be a singleton
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
                }),
                const SizedBox(height: AppSize.s16),
                const AuthDivider(),
                const SizedBox(height: AppSize.s16),
                GoogleAuthButton(onTap: () {
                  context.read<AuthBloc>().add(const AuthEvent.googleLogin());
                }),
                const SizedBox(height: AppSize.s16),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: FontSize.s14,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'By signing up, you agree to your ',
                        style: TextStyle(
                          color: AppColor.fontGray,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions ',
                        style: TextStyle(
                          color: AppColor.amber,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'and acknowledge that you have read our ',
                        style: TextStyle(
                          color: AppColor.fontGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColor.amber,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.s20),
                // Text.rich(
                //   TextSpan(
                //     style: const TextStyle(
                //       fontSize: FontSize.s16,
                //       fontFamily: 'Almarai',
                //       fontWeight: FontWeight.w400,
                //     ),
                //     children: [
                //       TextSpan(
                //         text: 'Already have an Account? ',
                //         style: TextStyle(
                //           color: AppColor.fontGray,
                //         ),
                //       ),
                //       TextSpan(
                //         text: 'Login',
                //         style: TextStyle(
                //           color: AppColor.primary,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: AppSize.s20),
              ],
            ),
          ),
          // _buildAuthForm()
              if (state.status == AuthStatus.loading)
                Positioned.fill(
                  child: Container(
                    color: AppColor.popUpGray,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                        strokeWidth: AppSize.s4,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  _buildBackGroundIllustration(width) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.8],
            colors: [
              AppColor.secondary,
              AppColor.white,
              // AppColor.white,
            ],
          )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            fit: BoxFit.cover,
            ImageAssets.patternOne,
            width: width,
            // height: height * 3 / 5,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.2, 0.6],
            colors: [
              AppColor.white.withOpacity(0.3),
              AppColor.white.withOpacity(1),
              // AppColor.white,
            ],
          )),
        ),
      ],
    );
  }

  // _buildAuthForm() {}
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColor.gray)),
        const SizedBox(width: AppSize.s8),
        const Text("Or"),
        const SizedBox(width: AppSize.s8),
        Expanded(child: Divider(color: AppColor.gray))
      ],
    );
  }
}
