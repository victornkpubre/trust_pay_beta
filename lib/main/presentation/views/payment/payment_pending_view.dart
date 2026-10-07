import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

/// Shown after the user finishes on the gateway's hosted checkout page.
/// Polls the backend briefly for the webhook-confirmed result. Bacs Direct
/// Debit (UK bank-account payments) settles 1-3 business days later, not
/// in seconds — this screen stops polling and switches to a "we'll notify
/// you" message rather than making the user wait around for that.
class PaymentPendingView extends StatefulWidget {
  final int paymentId;
  // Fired once, alongside the balance reload, when this top-up is
  // confirmed successful — lets a caller that opened this checkout to
  // cover a shortfall (e.g. paying an obligation) resume automatically.
  final VoidCallback? onSettled;

  const PaymentPendingView({super.key, required this.paymentId, this.onSettled});

  @override
  State<PaymentPendingView> createState() => _PaymentPendingViewState();
}

enum _TopUpOutcome { succeeded, failed }

class _PaymentPendingViewState extends State<PaymentPendingView> {
  static const _pollInterval = Duration(seconds: 3);
  static const _maxAttempts = 10;

  Timer? _timer;
  int _attempts = 0;
  bool _gaveUpPolling = false;

  // Kept here once seen, rather than read live from UserBloc: reloading the
  // user right after success changes the bloc's status, which used to drop
  // this screen back to the "Confirming…" spinner for good.
  _TopUpOutcome? _outcome;

  // When this top-up was to cover a transaction payment (onSettled), that
  // payment runs next — track it so its result is shown here instead of
  // being lost behind this screen.
  bool _completingTransaction = false;
  bool _transactionCompleted = false;
  String? _transactionError;

  @override
  void initState() {
    super.initState();
    _checkStatus();
    _timer = Timer.periodic(_pollInterval, (_) => _checkStatus());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _checkStatus() {
    if (_outcome != null) return;
    _attempts++;
    final userState = context.read<UserBloc>().state;
    context.read<UserBloc>().add(UserEvent.checkPaymentStatus(userState, widget.paymentId));

    if (_attempts >= _maxAttempts) {
      _timer?.cancel();
      setState(() => _gaveUpPolling = true);
    }
  }

  void _onUserState(BuildContext context, UserState state) {
    if (_outcome != null) return;
    if (state.status == UserBlocStatus.paymentSuccessful) {
      _timer?.cancel();
      setState(() {
        _outcome = _TopUpOutcome.succeeded;
        _completingTransaction = widget.onSettled != null;
      });
      context.read<UserBloc>().add(UserEvent.loadUser(state.user?.id ?? -1, state));
      widget.onSettled?.call();
    } else if (state.status == UserBlocStatus.paymentFailed) {
      _timer?.cancel();
      setState(() => _outcome = _TopUpOutcome.failed);
    }
  }

  void _onTransactionDetailsState(BuildContext context, TransactionDetailsState state) {
    if (!_completingTransaction) return;
    if (state.state == TransactionDetailsBlocStatus.transactionUpdated) {
      setState(() {
        _completingTransaction = false;
        _transactionCompleted = true;
      });
    } else if (state.state == TransactionDetailsBlocStatus.error) {
      setState(() {
        _completingTransaction = false;
        _transactionError = state.errorMessage;
      });
    }
  }

  void _goHome() {
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(listener: _onUserState),
          BlocListener<TransactionDetailsBloc, TransactionDetailsState>(listener: _onTransactionDetailsState),
        ],
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (_outcome == _TopUpOutcome.succeeded) return _buildSucceeded();

            if (_outcome == _TopUpOutcome.failed) {
              return _buildResult(
                icon: FontAwesomeIcons.xmark,
                iconColor: AppColor.lightRed,
                title: 'Payment Failed',
                message: "That payment didn't go through. You haven't been charged for a deposit that failed.",
              );
            }

            final isSlowBankDebit = state.paymentStatus?.isSlowBankDebit ?? false;

            if (_gaveUpPolling || isSlowBankDebit) {
              return _buildResult(
                icon: FontAwesomeIcons.clock,
                iconColor: AppColor.primary,
                title: isSlowBankDebit ? 'Bank Payment Processing' : 'Still Processing',
                message: isSlowBankDebit
                    ? "This can take up to 3 business days since it's a bank debit — we'll notify you once it clears. Safe to close this screen."
                    : "We're still confirming this payment. We'll notify you once it's done — safe to close this screen.",
                showRetry: !isSlowBankDebit,
              );
            }

            return _buildWaiting('Confirming your payment...');
          },
        ),
      ),
    );
  }

  Widget _buildSucceeded() {
    if (widget.onSettled == null) {
      return _buildResult(
        icon: Icons.check,
        iconColor: AppColor.green,
        title: 'Payment Successful',
        message: 'Your wallet has been credited.',
      );
    }
    if (_completingTransaction) {
      return _buildWaiting('Payment received — completing your transaction payment...');
    }
    if (_transactionError != null) {
      return _buildResult(
        icon: FontAwesomeIcons.triangleExclamation,
        iconColor: AppColor.amber,
        title: 'Transaction Payment Not Completed',
        message: '${_transactionError!} The money is in your wallet, so you can pay from your wallet instead.',
      );
    }
    return _buildResult(
      icon: Icons.check,
      iconColor: AppColor.green,
      title: 'Payment Successful',
      message: _transactionCompleted
          ? 'Your transaction payment is complete.'
          : 'Your wallet has been credited.',
    );
  }

  Widget _buildWaiting(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: AppSize.s24),
            Text(message, style: appTextBlack20Bold, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildResult({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    bool showRetry = false,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
              child: Icon(icon, color: AppColor.white, size: 48),
            ),
            const SizedBox(height: AppSize.s20),
            Text(title, style: appTextBlack24Bold, textAlign: TextAlign.center),
            const SizedBox(height: AppSize.s8),
            Text(message, style: appTextGray18, textAlign: TextAlign.center),
            const SizedBox(height: AppSize.s24),
            if (showRetry)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s16),
                child: SecondaryButton(
                  title: 'Check Again',
                  onTap: () {
                    setState(() {
                      _gaveUpPolling = false;
                      _attempts = 0;
                    });
                    _checkStatus();
                    _timer = Timer.periodic(_pollInterval, (_) => _checkStatus());
                  },
                ),
              ),
            PrimaryButton(title: 'Go Home', onTap: _goHome),
          ],
        ),
      ),
    );
  }
}
