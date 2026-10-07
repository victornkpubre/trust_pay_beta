import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
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
    initiate();
  }

  Future<void> initiate() async {
    await Future.delayed(const Duration(seconds: 4));
    final user = userAuthenticated(context);
    if(user!=null&&userOnline(context)) {
      final user = context.read<AppPreferences>().getUser()!;
      context.read<UserBloc>().add(UserEvent.loadUser(user.id??-1, UserState()));
      context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(user.id??-1, AppConstants.pageSize, 1, TransactionBlocState()));
      Navigator.pushReplacementNamed(context, Routes.home);
    }
    else {
      Navigator.pushReplacementNamed(context, Routes.auth);
    }

  }

  bool userOnline(BuildContext context){
    return context.read<AppPreferences>().getAuthState()??false;
  }

  User? userAuthenticated(BuildContext context){
    return context.read<AppPreferences>().getUser();
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
