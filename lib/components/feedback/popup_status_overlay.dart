import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/feedback/error_retry_view.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';

/// The layer a bottom-sheet popup puts over its content while an action it
/// started is running: a spinner while [loading], or — if the action failed
/// — the error with Retry and Close. Renders nothing otherwise. Place it as
/// the last child of the popup's Stack.
class PopupStatusOverlay extends StatelessWidget {
  final bool loading;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final VoidCallback onClose;

  const PopupStatusOverlay({
    super.key,
    required this.loading,
    required this.errorMessage,
    required this.onRetry,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessage != null && errorMessage!.isNotEmpty;
    if (!loading && !hasError) return const Positioned.fill(child: IgnorePointer(child: SizedBox.shrink()));

    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        child: hasError
            ? ErrorRetryView(
                message: errorMessage!,
                onRetry: onRetry,
                secondaryAction: SecondaryButton(title: 'Close', onTap: onClose),
              )
            : const Center(child: AppCircleProgressIndicator()),
      ),
    );
  }
}
