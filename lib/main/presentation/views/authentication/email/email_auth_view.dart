import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/biometric_button.dart';
import 'package:trust_pay_beta/components/buttons/google_auth_btn.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/presentation/blocs/auth/auth_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/authentication/auth_view.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

import '../../../../app/routes.dart';

class EmailAuthView extends StatefulWidget {
  static const String routeName = '/auth/email';

  const EmailAuthView({super.key});

  @override
  State<EmailAuthView> createState() => _EmailAuthViewState();
}

class _EmailAuthViewState extends State<EmailAuthView> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool registering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state.status == AuthStatus.error) {
              toast(message: state.errorMessage);
            }

            if(state.status == AuthStatus.authenticated) {
              storeToken(state.token);
              loadUser(state.user!.id!);
              loadUserHistory(state.user!.id!, 1);
              Navigator.of(context).pushReplacementNamed(
                  Routes.home
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: AppSize.s16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              registering ? "Sign Up with Email" : "Login with Email",
                              style: appTextBlack24Bold),
                        ],
                      ),
                      const SizedBox(height: AppSize.s20),
                      registering
                          ? AppTextInput(
                              title: "First Name",
                              type: TextInputType.name,
                              controller: firstController,
                              hint: 'John')
                          : Container(),
                      registering ? const SizedBox(height: AppSize.s8) : Container(),
                      registering
                          ? AppTextInput(
                              title: "Last Name",
                              type: TextInputType.name,
                              controller: lastController,
                              hint: 'Doe')
                          : Container(),
                      registering ? const SizedBox(height: AppSize.s8) : Container(),
                      AppTextInput(
                          title: "Email",
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          hint: 'John@yahoo.com'),
                      const SizedBox(height: AppSize.s8),
                      AppTextInput(
                          title: "Password",
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          hint: '*********'),
                      const SizedBox(height: AppSize.s32),
                      !registering
                          ? const SizedBox(height: AppSize.s16)
                          : Container(),
                      PrimaryButton(
                          title: registering ? "Register" : "Login", onTap: () {
                            if(_validated()) {
                              if(registering) {
                                _register(
                                  firstController.value.text.trim(),
                                  lastController.value.text.trim(),
                                  emailController.value.text.trim(),
                                  passwordController.value.text.trim(),
                                );
                              }
                              else {
                                _login(
                                    emailController.value.text.trim(),
                                    passwordController.value.text.trim()
                                );
                              }
                            }
                          }),
                      const SizedBox(height: AppSize.s8),
                      !registering ? const SizedBox(height: AppSize.s8) : Container(),
                      !registering ? BiometricsButton(onTap: () {}) : Container(),
                      !registering ? const SizedBox(height: AppSize.s8) : Container(),
                      const AuthDivider(),
                      const SizedBox(height: AppSize.s8),
                      GoogleAuthButton(
                          title: registering
                              ? "Register with Google "
                              : 'Login with Google',
                          onTap: () {}),
                      const SizedBox(height: AppSize.s8),
                      InkWell(
                        onTap: () => setState(() {
                          _toggleAuthType();
                        }),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: FontSize.s16,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: registering
                                    ? 'Already have an Account? '
                                    : "Don't have an account yet? ",
                                style: TextStyle(
                                  color: AppColor.fontGray,
                                ),
                              ),
                              TextSpan(
                                text: registering ? 'Login' : 'Register',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s20),
                    ],
                  ),
                ),

                state.status == AuthStatus.loading?
                Positioned.fill(
                  child: Container(
                    color: AppColor.popUpGray,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                        strokeWidth: AppSize.s4,
                      ),
                    ),
                  )
                ): Container()
              ],
            );
          },
        ));
  }

  _toggleAuthType() {
    registering = !registering;
  }

  bool _validated() {
    if(registering) {
      return firstController.value.text.isNotEmpty && 
      lastController.value.text.isNotEmpty && 
      emailController.value.text.isNotEmpty && 
      passwordController.value.text.isNotEmpty;
    }
    else {
      return emailController.value.text.isNotEmpty && 
      passwordController.value.text.isNotEmpty;
    }
  }

  _login(String email, String password) {
    context.read<AuthBloc>().add(AuthEvent.login(email, password));
  }

  _register(String firstName, String lastName, String email, String password) {
    context.read<AuthBloc>().add(AuthEvent.register(firstName, lastName, email, password));
  }
  
  void loadUser(int id) {
    context.read<UserBloc>().add(UserEvent.loadUser(id));
  }
  
  void loadUserHistory(int id, int page) {
    context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(id, AppConstants.pageSize, page));
  }
  
  void storeToken(String token) {
    context.read<AppPreferences>().setAccessToken(token);
  }
  
}
