import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// One place that turns any exception into a message safe to show the user.
/// Never surface `error.toString()` — it leaks Dio/Socket internals
/// ("DioException [connection error]: ... errno = 7").

class ErrorMessages {
  static const noConnection = "Can't connect. Check your internet and try again.";
  static const timeout = 'The server is taking too long to respond. Please try again.';
  static const server = 'Something went wrong on our end. Please try again.';
  static const unknown = 'Something went wrong. Please try again.';

  /// Messages for failures where trying the same thing again can succeed —
  /// these are the ones that get a Retry button.
  static const retryable = {noConnection, timeout, server};
}

bool isNoConnectionError(Object error) {
  if (error is SocketException) return true;
  if (error is DioException) {
    return error.type == DioExceptionType.connectionError ||
        (error.type == DioExceptionType.unknown && error.error is SocketException);
  }
  return false;
}

bool isTimeoutError(Object error) {
  if (error is TimeoutException) return true;
  if (error is DioException) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout;
  }
  return false;
}

/// A user-facing message for [error]. For a server response that carries
/// its own readable `message` (Laravel validation, "Insufficient balance",
/// etc.) that message is kept; otherwise a generic one is used.
String friendlyErrorMessage(Object error) {
  if (isNoConnectionError(error)) return ErrorMessages.noConnection;
  if (isTimeoutError(error)) return ErrorMessages.timeout;
  if (error is DioException && error.type == DioExceptionType.badResponse) {
    final data = error.response?.data;
    // Laravel replies {"message": ...}; the FastAPI AI service {"detail": ...}.
    for (final key in const ['message', 'detail']) {
      if (data is Map && data[key] is String && (data[key] as String).trim().isNotEmpty) {
        return data[key] as String;
      }
    }
    final status = error.response?.statusCode ?? 0;
    if (status >= 500) return ErrorMessages.server;
  }
  return ErrorMessages.unknown;
}

/// Whether a message shown to the user is for a failure worth retrying.
bool isRetryableMessage(String? message) => message != null && ErrorMessages.retryable.contains(message);
