import 'package:trust_pay_beta/main/data/network/error_handler.dart';

class Failure {
  int code;
  String message;

  Failure(this.code, this.message);

  /// From a caught exception — friendly message, never the raw exception text.
  factory Failure.fromError(Object error) => Failure(502, friendlyErrorMessage(error));

  bool get isRetryable => isRetryableMessage(message);
}
