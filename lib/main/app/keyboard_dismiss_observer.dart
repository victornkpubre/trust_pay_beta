import 'package:flutter/widgets.dart';

/// Closes the on-screen keyboard on every navigation — push, pop, replace,
/// or remove, including dialogs and bottom sheets — so a keyboard opened on
/// one screen never carries over to the next. Registered once on
/// MaterialApp.navigatorObservers; screens don't need to do anything.
class KeyboardDismissObserver extends NavigatorObserver {
  void _dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => _dismissKeyboard();

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => _dismissKeyboard();

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) => _dismissKeyboard();

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => _dismissKeyboard();
}
