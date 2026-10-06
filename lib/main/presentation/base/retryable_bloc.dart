import 'package:flutter_bloc/flutter_bloc.dart';

/// Remembers the last action event a bloc received so a Retry button can
/// replay it with `bloc.retry()` — no screen has to rebuild the event itself.
/// Override [isRetryable] to skip events that only shuffle UI state (they
/// would otherwise replace the action that actually failed).
mixin RetryableBloc<E, S> on Bloc<E, S> {
  E? _lastEvent;

  bool isRetryable(E event) => true;

  @override
  void onEvent(E event) {
    super.onEvent(event);
    if (isRetryable(event)) _lastEvent = event;
  }

  /// Replays the last retryable event. Returns false if there's nothing to retry.
  bool retry() {
    final event = _lastEvent;
    if (event == null || isClosed) return false;
    add(event);
    return true;
  }
}
