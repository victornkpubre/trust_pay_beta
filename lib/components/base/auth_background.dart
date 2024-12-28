
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(bottom: 2),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF9EFFF)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.7447600960731506), Colors.white],
            ),
          ),
        ),
        Positioned(
          top: -50,
          child: SvgPicture.asset(
            "assets/images/pattern1.svg",
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}