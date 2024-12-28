import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/list_iems/profile_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/account_tile_secondary.dart';

enum UiState { requesting, verifying, resetting }

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UiState state = UiState.resetting;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Container(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: AppSize.s16),
              Stack(
                children: [
                  const Positioned(
                      top: 4,
                      left: AppSize.s8,
                      child: AppBackButton(size: AppSize.s16)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Profile',
                            style: appTextBlack24Bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s8),
              Stack(
                children: [
                  UserImage(
                    image: ProfileIconAssets.profile,
                    size: width / 4.5,
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                        padding: const EdgeInsets.all(AppSize.s8),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.lightGray, width: 2),
                            shape: BoxShape.circle,
                            color: AppColor.primary),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: AppSize.s16,
                          color: AppColor.lightGray,
                        )),
                  )
                ],
              ),
              const SizedBox(height: AppSize.s8),
              Text('Victor Nelson', style: appTextBlack16Bold),
              const SizedBox(height: AppSize.s4),
              const AccountTileSecondary(accountNumber: '345324566'),
              const SizedBox(height: AppSize.s8),
              const ProfileItem(
                type: ProfileType.edit,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.account,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.biometrics,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.mediation,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.reset,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.support,
              ),
              const SizedBox(height: AppSize.s10),
              const ProfileItem(
                type: ProfileType.logout,
              ),
            ],
          ),
        ));
  }
}
