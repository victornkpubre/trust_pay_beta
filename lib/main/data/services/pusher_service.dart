import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/presentation/base/notification_stream.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart' as app_toast;

class PusherService {
  final PusherChannelsFlutter  pusherChannels = PusherChannelsFlutter.getInstance();
  final PusherBeams  pusherBeams = PusherBeams.instance;
  static final PusherService instance = PusherService._internal();
  PusherService._internal();

  Future<void> init() async {
    await initPusherBeams();
    await initPusherChannels();
  }

  Future<void> initPusherChannels() async {
    try {
      await pusherChannels.init(
          apiKey: AppConstants.pusherApiKey,
          cluster: 'eu',
          onEvent: (event) {
            final map = jsonDecode(event.data);
            // "ai-notice": trust_pay_ai's proactive push (Stage 4) — a
            // self-contained title/body, no notification row to look up.
            // "my-event" (Laravel's default broadcastAs()): the existing
            // transaction-notification flow, keyed by a notification id.
            if (event.eventName == 'ai-notice') {
              app_toast.toast('${map['title']}: ${map['body']}');
              return;
            }
            final notificationId = int.parse(map['notification']);
            BackgroundNotificationStream.addTransaction(notificationId);
          },
          onSubscriptionError: (message, e) {
            print("onSubscriptionError: $message Exception: $e");
          },
          onSubscriptionSucceeded: (name, data) {
            print("onSubscriptionSucceeded: $name data: $data");
          },
          onConnectionStateChange: ( currentState, previousState) {
            print("Connection: $currentState");
          }
      );
      await pusherChannels.connect();
    }
    catch(e) {
      print( e.toString());
    }
  }

  dispose(){
    pusherChannels.disconnect();
  }

  subscribeToTopic(String topic) async {
    await pusherChannels.subscribe(channelName: topic);
    await pusherBeams.addDeviceInterest(topic);
  }
  unsubscribeFromTopic(String topic) async {
    await pusherChannels.unsubscribe(channelName: topic);
    await pusherBeams.removeDeviceInterest(topic);
  }

  Future<void> initPusherBeams() async {
    const instanceID = '640ee50d-970a-47e4-a704-47a9b8b58a15';
    await pusherBeams.start(instanceID);
    await pusherBeams.onMessageReceivedInTheForeground(_onMessageReceivedInTheForeground);
    await pusherBeams.getDeviceInterests().then((interests) {
      print("Subscribed Interests: $interests");
    });
    // await _checkForInitialMessage();
  }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    print('Got notification in foreground');
    final map = data.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    final mapTitle = (map['title'] as String);
    final mapBody = (map['body'] as String);
    final mapData = (map['data'] as Map).map((key, value) {
      return MapEntry(key.toString(), value);
    });

    final id = (mapData['notification'] as String);
    BackgroundNotificationStream.addTransaction(int.parse(id));
  }

}