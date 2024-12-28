import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

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
          apiKey: '28d4015c1cc8edbdc8d6',
          cluster: 'eu',
          onEvent: (event) {
            print(event.eventName);
            Fluttertoast.showToast(msg: event.data);
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

      subscribeToTopic('transaction-notification-1');

    }
    catch(e) {
      Fluttertoast.showToast(msg: e.toString());
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
    await _checkForInitialMessage();
  }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    print('Got notification in foreground');
    print(data);
  }

  Future<void> _checkForInitialMessage() async {
    await Future.delayed(const Duration(seconds: 1));
    final initialMessage = await PusherBeams.instance.getInitialMessage();
    if (initialMessage != null) {
      print(initialMessage);
    }
  }

}