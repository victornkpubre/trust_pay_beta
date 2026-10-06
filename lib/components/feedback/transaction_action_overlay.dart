import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/feedback/popup_status_overlay.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

/// Drop-in overlay for a popup that fires a TransactionDetailsBloc action
/// (accept, reject, generate/verify token, ...). While [running], it shows a
/// spinner until the bloc reports the result, then either calls
/// [onCompleted] or shows the error with Retry/Close. Only reacts to new
/// bloc states, so a stale error/success from an earlier action can't
/// trigger it. Place it as the last child of the popup's Stack.
class TransactionActionOverlay extends StatefulWidget {
  /// True once the popup has submitted its action.
  final bool running;
  /// Re-submits the same action (same arguments as the first attempt).
  final VoidCallback onRetry;
  final VoidCallback? onCompleted;
  final VoidCallback onClose;

  const TransactionActionOverlay({
    super.key,
    required this.running,
    required this.onRetry,
    required this.onClose,
    this.onCompleted,
  });

  @override
  State<TransactionActionOverlay> createState() => _TransactionActionOverlayState();
}

class _TransactionActionOverlayState extends State<TransactionActionOverlay> {
  bool _completed = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionDetailsBloc, TransactionDetailsState>(
      listener: (context, state) {
        if (!widget.running || _completed) return;
        if (state.state == TransactionDetailsBlocStatus.transactionUpdated) {
          setState(() {
            _completed = true;
            _errorMessage = null;
          });
          widget.onCompleted?.call();
        } else if (state.state == TransactionDetailsBlocStatus.error) {
          setState(() => _errorMessage = state.errorMessage);
        }
      },
      child: PopupStatusOverlay(
        loading: widget.running && !_completed,
        errorMessage: _errorMessage,
        onRetry: () {
          setState(() => _errorMessage = null);
          widget.onRetry();
        },
        onClose: widget.onClose,
      ),
    );
  }
}
