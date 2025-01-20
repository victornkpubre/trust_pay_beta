import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/firebase_options.dart';
import 'package:trust_pay_beta/main/app/app.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/services/fcm_service.dart';

import 'main/data/services/pusher_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmService.instance.init();
  await PusherService.instance.init();
  runApp(const TrustPayApp());
}

Future<void> onMessageReceivedInTheBackground(RemoteMessage? response) async {
  _onMessageReceivedInTheBackground(response);
}

Future<void> _onMessageReceivedInTheBackground(RemoteMessage? response) async {
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print('Got notification in background');
}
