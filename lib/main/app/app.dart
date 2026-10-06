import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_pay_beta/main/app/dependency_injector.dart';
import 'package:trust_pay_beta/main/app/keyboard_dismiss_observer.dart';
import 'package:trust_pay_beta/main/app/routes.dart';

class TrustPayApp extends StatefulWidget {
  const TrustPayApp({super.key});

  @override
  State<TrustPayApp> createState() => _TrustPayAppState();
}

class _TrustPayAppState extends State<TrustPayApp> {
  late DependencyInjector di;
  final _keyboardDismissObserver = KeyboardDismissObserver();

  @override
  void initState() {
    super.initState();
    di = DependencyInjector();
    di.initPref();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: di.inject(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trust Pay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorObservers: [_keyboardDismissObserver],
        ),
    );
  }
}
