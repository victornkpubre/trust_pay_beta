import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/inputs/app_toggle_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';

enum ProfileType {edit, account, biometrics, mediation, reset, support, logout}
class ProfileItem extends StatelessWidget {
  final ProfileType type;
  const ProfileItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                _getProfileIcon(type),
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 16),

              Text(
                _getItemTitle(type),
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.fontGray,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
      
          _buildTrailing(type)
        ],
      ),
    );
  }
}

_buildTrailing(ProfileType type) {
  switch (type) {
    case ProfileType.edit:
    case ProfileType.account:
    case ProfileType.reset:
    case ProfileType.support:
      return const Icon(
        FontAwesomeIcons.angleRight,
        size: 12,
      );
    case ProfileType.biometrics:
    case ProfileType.mediation:
      return AppToggle(
        onToogle: (value) {
          
        },
      );
    case ProfileType.logout:
      return Container();
    default:
  }
}

_getItemTitle(ProfileType type){
  switch (type) {
    case ProfileType.edit:
      return "Edit Personal Info";
    case ProfileType.account:
      return "Account Info";
    case ProfileType.biometrics:
      return "Enable Biometrics/Face ID";
    case ProfileType.mediation:
      return "Mediation";
    case ProfileType.reset:
      return "Reset Password";
    case ProfileType.support:
      return "Support";
    case ProfileType.logout:
      return "Log Out";
    default:
  }
}

_getProfileIcon(ProfileType type){
  switch (type) {
    case ProfileType.edit:
      return ProfileIconAssets.edit;
    case ProfileType.account:
      return ProfileIconAssets.account;
    case ProfileType.biometrics:
      return ProfileIconAssets.biometrics;
    case ProfileType.mediation:
      return ProfileIconAssets.mediation;
    case ProfileType.reset:
      return ProfileIconAssets.reset;
    case ProfileType.support:
      return ProfileIconAssets.support;
    case ProfileType.logout:
      return ProfileIconAssets.logout;
    default:
  }
}