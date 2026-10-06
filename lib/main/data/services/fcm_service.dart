import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/presentation/base/notification_stream.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
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
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      toast("Notification Permission not Granted");
    }

    FirebaseMessaging.onBackgroundMessage(onMessageReceivedInTheBackground);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Got Initial Message on onMessageOpenedApp');
      final mapData = message.data;
      BackgroundNotificationStream.addTransaction(int.parse(mapData['notification']));
    });

    FirebaseMessaging.onMessage.listen(onMessageReceivedInTheBackground);
  }

  Future<void> initInfo() async {
    var androidInitialize = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }
  
  Future<void> setDeviceToken(BuildContext context) async {
    await FirebaseMessaging.instance.getToken().then((token) {
      if(token != null) {
        print("FCM Token: $token");
        context.read<UserBloc>().add(UserEvent.setFcmToken(const UserState(), token));
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      context.read<UserBloc>().add(UserEvent.setFcmToken(const UserState(), token));
    });
  }

}
