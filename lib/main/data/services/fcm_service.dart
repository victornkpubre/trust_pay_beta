
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../main.dart';

class FcmService {
  final FirebaseMessaging fcmService = FirebaseMessaging.instance;
  static final FcmService instance = FcmService._internal();
  FcmService._internal();

  Future<void> init() async {
   await requestPermission();
   await initInfo();
  }

  requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(onMessageReceivedInTheBackground);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageReceivedInTheBackground);
    FirebaseMessaging.onMessage.listen(onMessageReceivedInTheBackground);
  }

  Future<void> initInfo() async {
    var androidInitialize = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }

}
