import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/feedback/retry_error_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/list_iems/profile_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/account_tile_secondary.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/auth/auth_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

enum UiState { editing, viewing }

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final picker = ImagePicker();
  File? profileImage;
  UiState state = UiState.viewing;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    businessNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.white,
        body: UserErrorListener(child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, authState) {
            if(authState.status==AuthStatus.loggedOut){
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.splashRoute, (Route<dynamic> route) => false);
            }
          },
          builder: (context, authState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                final user = userState.user;
            
                firstNameController.text=user?.firstName??'';
                lastNameController.text=user?.lastName??'';
                businessNameController.text=user?.businessName??'';
            
                return userState.status == UserBlocStatus.loading || authState.status == AuthStatus.loading || user == null
                ? Container(
                    color: AppColor.white,
                    child: const Center(child: AppCircleProgressIndicator())
                )
                : Container(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: MediaQuery.of(context).viewPadding.top),
                      Stack(
                        children: [
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
            
                          Positioned(
                              top: 4,
                              left: AppSize.s8,
                              child: AppBackButton(
                                size: AppSize.s16,
                                onTap: () {
                                  if(state == UiState.editing){
                                    setState(() {
                                      state = UiState.viewing;
                                    });
                                  }
                                  else {
                                    Navigator.of(context).pushReplacementNamed(Routes.home);
                                  }
                                },
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s8),
            
                      InkWell(
                        onTap: () {
                          _pickImage(user, userState);
                        },
                        child: Stack(
                          children: [
                            UserImage(
                              image: user.profileImage,
                              size: width / 4.5,
                            ),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                  padding: const EdgeInsets.all(AppSize.s8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.lightGray, width: 2),
                                      shape: BoxShape.circle,
                                      color: AppColor.primary
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: AppSize.s16,
                                    color: AppColor.lightGray,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSize.s8),

                      Text(user.toUserInput().username, style: appTextBlack16Bold),
                      const SizedBox(height: AppSize.s4),

                      AccountTileSecondary(accountNumber: user.account?.accountNumber??''),
                      const SizedBox(height: AppSize.s8),
            
                      state == UiState.viewing?
                      _buildProfileMenu(user, userState):
                      _buildEditDetailsForm(user, userState)
                    ],
                  ),
                );
              },
            );
          }
        ))
    );
  }

  _buildProfileMenu(User user, userState) {
    return Column(
      children: [
        ProfileItem(
          type: ProfileType.edit,
          onTap: () {
            setState(() {
              state = UiState.editing;
            });
          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.account,
          onTap: () {
            Navigator.of(context).pushNamed(Routes.accountView);
          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.biometrics,
          onTap: () {
            
          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.mediation,
          mediationStatus: user.mediator,
           // => _saveUserMediationStatus(user, !user.mediator, userState),
          onTap: () {},
          onToggle: (status) => _saveUserMediationStatus(user, status, userState),
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.reset,
          onTap: () {

          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.support,
          onTap: () {
            Navigator.pushNamed(context, Routes.aiChatView);
          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.chats,
          onTap: () {
            Navigator.pushNamed(context, Routes.conversationsList);
          },
        ),
        const SizedBox(height: AppSize.s10),
        ProfileItem(
          type: ProfileType.logout,
          onTap: () {
            _logout(user);
          },
        ),
      ],
    );
  }

  _buildEditDetailsForm(User user, UserState userState) {
    return Column(
      children: [
        AppTextInput(
            title: "First Name",
            type: TextInputType.name,
            controller: firstNameController,
            hint: 'John'
        ),
        const SizedBox(height: AppSize.s8),

        AppTextInput(
            title: "Last Name",
            type: TextInputType.name,
            controller: lastNameController,
            hint: 'Doe'
        ),
        const SizedBox(height: AppSize.s8),

        AppTextInput(
            title: "Business Name",
            type: TextInputType.emailAddress,
            controller: businessNameController,
            hint: 'Johnson and Co.',
        ),
        const SizedBox(height: AppSize.s64),

        PrimaryButton(
            title: "Save",
            onTap: () => _saveUserUpdates(user, userState)
        ),

      ],
    );
  }

  _saveUserMediationStatus(User user, status, userState){
    context.read<UserBloc>().add(UserEvent.updateUser(
        user.copyWith(
          mediator: status,
        ),
        userState
    ));
  }

  _saveUserUpdates(User user, userState) {
    context.read<UserBloc>().add(UserEvent.updateUser(
        user.copyWith(
          firstName: firstNameController.value.text,
          lastName: lastNameController.value.text,
          businessName: businessNameController.value.text,
        ),
        userState
    ));

    firstNameController.text = '';
    lastNameController.text = '';
    businessNameController.text = '';

  }

  _saveUserImage(user , userState){
    if(profileImage != null) {
      context.read<UserBloc>().add(UserEvent.updateUserImage(
        user.id,
        profileImage!,
        userState
      ));
    }
  }

  _pickImage(User user, userState) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      profileImage = File(pickedFile.path);
      _saveUserImage(user, userState);
    }
  }

  void _logout(User user) {
    context.read<AuthBloc>().add(AuthEvent.logout(user));
  }
}
