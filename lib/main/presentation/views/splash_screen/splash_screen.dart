import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/presentation/views/authentication/auth_view.dart';

import '../../../app/routes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    opacityAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(controller);

    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, Routes.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedBuilder(
              animation: opacityAnimation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                    opacity: opacityAnimation.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.logoTitle,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                        ),
                      ],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
