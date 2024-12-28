import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class UserImage extends StatelessWidget {
  final String image;
  final double? size;
  final Color? backgroundColor;
  final double? borderWidth;

  const UserImage({
    super.key,
    required this.image,
    this.size,
    this.backgroundColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (size ?? 40) / 2,
      backgroundColor: backgroundColor ?? AppColor.secondary,
      child: Padding(
        padding: EdgeInsets.all(borderWidth ?? 2), // Border radius
        child: ClipOval(
            child: Image.network(
          image,
          fit: BoxFit.cover,
          height: size ?? 40,
          width: size ?? 40,
        )),
      ),
    );
  }
}
