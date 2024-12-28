import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';

class TransactionMembersTile extends StatelessWidget {
  final List<UserInput> members;
  final double iconSize;
  final int? maxProfile;
  final bool? showCount;
  final Color? primaryColor;
  final Color? secondaryColor;
  const TransactionMembersTile({
    super.key,
    required this.members,
    required this.iconSize,
    this.showCount,
    this.maxProfile, 
    this.primaryColor, 
    this.secondaryColor
  });

  @override
  Widget build(BuildContext context) {
    return members.isNotEmpty?
      _buildMembersSection(members, iconSize, showCount??false, maxProfile, primaryColor, secondaryColor): Container();
  }
}

_buildMembersSection(List<UserInput> members, double iconSize, bool showCount, int? maxProfile, Color? primaryColor, Color? secondaryColor) {
  print('transaction members count: ${members.length}');
  if(members.length>1){
        return _buildMembersWidget(members, iconSize, showCount, maxProfile);
      }
      else {
        return _buildUserWidget(members[0], iconSize, primaryColor, secondaryColor);
      }
}

_buildUserWidget(UserInput member, double iconSize, Color? primaryColor, Color? secondaryColor) {
  return UserProfileTile(
    size: iconSize,
    username: member.username,
    image: member.image,
    account: member.account,
    primaryColor: primaryColor??AppColor.white,
    secondaryColor: secondaryColor??AppColor.white,
    expanded: false,
  );
}

_buildMembersWidget(List<UserInput> members, iconSize, showCount, maxProfile) {
  List<Positioned> widgetList = [];
  widgetList.add(
    Positioned(
      child: Container(
        height: iconSize,
        width: iconSize,
        decoration: ShapeDecoration(
          color: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Center(
          child: Text("+${members.length - 4}"),
        ),
      ),
    ),
  );

  for (var i = 0; i < min(4, members.length); i++) {
    var item = members[i];
    widgetList.add(Positioned(
      left: 28.0 * i,
      child: UserImage(
        image: item.image,
        size: iconSize,
      ),
    ));
  }

  int items = min(members.length, 3);
  members.length > (maxProfile ?? 3) || (showCount ?? false)
      ? widgetList.add(Positioned(
          left: 28 * items.toDouble(),
          child: Container(
            height: iconSize,
            width: iconSize,
            decoration: ShapeDecoration(
              color: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Center(
              child: members.length > (maxProfile ?? 3) && !showCount
                  ? Text("+${members.length - (maxProfile ?? 3)}",
                      style: appTextBlack14Bold)
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${members.length}",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: FontSize.s18,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.normal,
                              height: 0.8),
                        ),
                        Text("people",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: FontSize.s10,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.normal,
                                height: 1)),
                      ],
                    ),
            ),
          ),
        ))
      : Container();

  return Stack(children: widgetList);
}
