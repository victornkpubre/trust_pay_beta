
import 'dart:async';

import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class TransactionNotificationObject {
  final int notificationId;
  TransactionNotificationObject(this.notificationId);
}

class BackgroundNotificationStream {
  static final _controller = StreamController<TransactionNotificationObject>.broadcast();

  static Stream<TransactionNotificationObject> get stream => _controller.stream;

  static void addTransaction(int notificationId) {
    _controller.add(TransactionNotificationObject(notificationId));
  }
}