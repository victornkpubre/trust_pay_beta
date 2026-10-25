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
      final notificationId = int.tryParse('${mapData['notification']}');
      if (notificationId != null) {
        BackgroundNotificationStream.addTransaction(notificationId);
      }
    });

    FirebaseMessaging.onMessage.listen(_onMessageReceivedInTheForeground);
  }

  // The OS doesn't display FCM pushes while the app is open, so show one
  // ourselves and tell the home screen to reload (it used to only log).
  void _onMessageReceivedInTheForeground(RemoteMessage message) {
    print('[Notification] FCM foreground: ${message.notification?.title} data=${message.data}');
    final notification = message.notification;
    if (notification != null) {
      _localNotifications.show(
        message.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'transactions',
            'Transactions',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
    }

    final notificationId = int.tryParse('${message.data['notification']}');
    if (notificationId != null) {
      BackgroundNotificationStream.addTransaction(notificationId);
    }
  }

  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initInfo() async {
    var androidInitialize = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await _localNotifications.initialize(initializationSettings);
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
