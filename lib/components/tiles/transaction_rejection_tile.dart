import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionRejectionTile extends StatelessWidget {
  final double iconSize;
  final double tileSize;
  final UserInput owner;
  final UserInput member;
  final TransactionType type;
  const TransactionRejectionTile(
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
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              getIcon(type),
              width: iconSize / 2,
              height: iconSize / 2,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserImage(image: owner.image, size: iconSize),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.red,
                      ),
                      borderRadius: BorderRadius.circular(iconSize)),
                  child: Icon(
                    FontAwesomeIcons.exclamation,
                    color: AppColor.red,
                    size: iconSize / 3.5,
                  ),
                ),
                const SizedBox(width: 4),
                UserImage(image: member.image, size: iconSize)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
