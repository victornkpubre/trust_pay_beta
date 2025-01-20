
import 'dart:async';

import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class BackgroundNotificationStream {
  static final _controller = StreamController<Transaction>.broadcast();

  static Stream<Transaction> get stream => _controller.stream;

  static void addTransaction(Transaction transaction) {
    _controller.add(transaction);
  }
}