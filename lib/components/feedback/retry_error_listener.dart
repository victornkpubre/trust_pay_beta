import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'package:trust_pay_beta/main/presentation/base/retryable_bloc.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

/// Wrap a screen in this to get the standard error handling for a bloc it
/// loads from: when [B] emits an error state, a snackbar shows the friendly
/// message with Retry (which replays the bloc's last action). Stays quiet
/// while a popup is on top, since popups show their own errors.
class RetryErrorListener<B extends RetryableBloc<dynamic, S>, S> extends StatelessWidget {
  /// The message to show if [state] is an error, otherwise null.
  final String? Function(S state) errorOf;
  final Widget child;

  const RetryErrorListener({super.key, required this.errorOf, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listenWhen: (previous, current) => errorOf(current) != null,
      listener: (context, state) {
        if (!isScreenOnTop(context)) return;
        showErrorSnackBar(
          context: context,
          message: errorOf(state)!,
          onRetry: () => context.read<B>().retry(),
        );
      },
      child: child,
    );
  }
}

class UserErrorListener extends StatelessWidget {
  final Widget child;
  const UserErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) => RetryErrorListener<UserBloc, UserState>(
        errorOf: (s) => s.status == UserBlocStatus.error ? (s.message ?? ErrorMessages.unknown) : null,
        child: child,
      );
}

class TransactionErrorListener extends StatelessWidget {
  final Widget child;
  const TransactionErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) => RetryErrorListener<TransactionBloc, TransactionBlocState>(
        errorOf: (s) => s.status == TransactionBlocStatus.error ? (s.message ?? ErrorMessages.unknown) : null,
        child: child,
      );
}
