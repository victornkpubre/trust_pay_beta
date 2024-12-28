import 'package:flutter/material.dart';

import '../../catalogue/catalogue.dart';
import '../domain/entities/base/entities.dart';
import '../presentation/views/account/account.dart';
import '../presentation/views/authentication/auth_view.dart';
import '../presentation/views/authentication/email/email_auth_view.dart';
import '../presentation/views/authentication/reset/password_reset_view.dart';
import '../presentation/views/authentication/verification/account_verification_view.dart';
import '../presentation/views/home/home_view.dart';
import '../presentation/views/home/notification_view.dart';
import '../presentation/views/home/search_view.dart';
import '../presentation/views/home/services_view.dart';
import '../presentation/views/profile/profile.dart';
import '../presentation/views/splash_screen/splash_screen.dart';
import '../presentation/views/transaction/create/bets_wagers/create_bets_wagers.dart';
import '../presentation/views/transaction/create/bill_splitter/create_bill_splitter_view.dart';
import '../presentation/views/transaction/create/money_pool/create_money_pool.dart';
import '../presentation/views/transaction/create/secure_sales/create_secure_sales_view.dart';
import '../presentation/views/transaction/view/transaction_details_view.dart';
import '../presentation/views/transaction/view/transaction_home_view.dart';

class Routes {
  static const String splashRoute = SplashScreen.routeName;
  static const String catalogue = Catalogue.routeName;
  static const String home = HomeView.routeName;
  static const String auth = AuthView.routeName;
  static const String emailAuthView = EmailAuthView.routeName;
  static const String accountVerificationView = AccountVerificationView.routeName;
  static const String passwordResetView = PasswordResetView.routeName;
  static const String profileView = ProfileView.routeName;
  static const String accountView = AccountView.routeName;
  static const String notificationView = NotificationView.routeName;
  static const String servicesView = ServicesView.routeName;
  static const String searchView = SearchView.routeName;
  static const String transactionsHome = TransactionHomeView.routeName;
  static const String transactionsDetails = TransactionDetailsView.routeName;
  static const String createSecureSales = CreateSecureSalesTransaction.routeName;
  static const String createBillSplitter = CreateBillSplitterTransaction.routeName;
  static const String createBetWager = CreateBetWagerTransaction.routeName;
  static const String createMoneyPool = CreateMoneyPoolTransaction.routeName;
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.splashRoute):
        return MaterialPageRoute(
            builder: ((context) => const SplashScreen()));

      case (Routes.catalogue):
        return MaterialPageRoute(
            builder: ((context) => const Catalogue()));

      case (Routes.home):
        return MaterialPageRoute(
            builder: ((context) => const HomeView()));

      case (Routes.auth):
        return MaterialPageRoute(
            builder: ((context) => const AuthView()));

      case (Routes.emailAuthView):
        return MaterialPageRoute(
            builder: ((context) => const EmailAuthView()));

      case (Routes.accountVerificationView):
        return MaterialPageRoute(
            builder: ((context) => const AccountVerificationView()));

      case (Routes.passwordResetView):
        return MaterialPageRoute(
            builder: ((context) => const PasswordResetView()));

      case (Routes.profileView):
        return MaterialPageRoute(
            builder: ((context) => const ProfileView()));
      case (Routes.accountView):
        return MaterialPageRoute(
            builder: ((context) => const AccountView()));

      case (Routes.notificationView):
        return MaterialPageRoute(
            builder: ((context) => const NotificationView()));

      case (Routes.servicesView):
        return MaterialPageRoute(
            builder: ((context) => const ServicesView()));

      case (Routes.searchView):
        return MaterialPageRoute(
            builder: ((context) => const SearchView()));

      case (Routes.transactionsHome):
        return MaterialPageRoute(builder: ((context) => TransactionHomeView(type: (routeSettings.arguments as TransactionType))));

      case (Routes.transactionsDetails):
        return MaterialPageRoute(
            builder: ((context) =>
              TransactionDetailsView(args: (routeSettings.arguments as TransactionDetailsViewArguments))));

      case (Routes.createSecureSales):
        return MaterialPageRoute(
            builder: ((context) => const CreateSecureSalesTransaction()));

      case (Routes.createBillSplitter):
        return MaterialPageRoute(builder: ((context) => const CreateBillSplitterTransaction()));

      case (Routes.createBetWager):
        return MaterialPageRoute(builder: ((context) => const CreateBetWagerTransaction()));

      case (Routes.createMoneyPool):
        return MaterialPageRoute(builder: ((context) => const CreateMoneyPoolTransaction()));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: ((_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text('Route Error'),
              ),
              body: const Center(child: Text('No Route Found')),
            ))
    );
  }

}