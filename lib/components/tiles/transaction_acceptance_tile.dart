import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionAcceptanceTile extends StatelessWidget {
  final double iconSize;
  final double tileSize;
  final UserInput owner;
  final UserInput member;
  final TransactionType type;
  const TransactionAcceptanceTile(
      {super.key,
      required this.iconSize,
      required this.tileSize,
      required this.owner,
      required this.member,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tileSize,
      height: tileSize,
      child: Stack(
        children: [
          SvgPicture.asset(
            SvgIconAssets.arrows_illustration,
            height: tileSize,
            width: tileSize,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: iconSize / 2.5,
                  height: iconSize / 2.5,
                  decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(iconSize)),
                  child: Icon(
                    Icons.check,
                    color: AppColor.white,
                    size: iconSize / 3,
                  ),
                ),
                Image.asset(
                  getIcon(type),
                  width: iconSize / 2,
                  height: iconSize / 2,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Transform.translate(
                    offset: Offset(-iconSize * 0.3, 0),
                    child: UserImage(image: owner.image, size: iconSize)),
                Transform.translate(
                    offset: Offset(iconSize * 0.3, 0),
                    child: UserImage(image: member.image, size: iconSize)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
