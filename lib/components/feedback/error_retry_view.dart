import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';

/// A failed load: friendly message, plus a Retry button when the failure is
/// one that retrying can fix (no internet, timeout, server error). Used for
/// whole screens/sections and inside popups via [PopupStatusOverlay].
class ErrorRetryView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  /// Extra action under Retry, e.g. Close in a popup.
  final Widget? secondaryAction;

  const ErrorRetryView({super.key, required this.message, this.onRetry, this.secondaryAction});

  @override
  Widget build(BuildContext context) {
    final showRetry = onRetry != null && isRetryableMessage(message);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              message == ErrorMessages.noConnection ? Icons.wifi_off : Icons.error_outline,
              size: 48,
              color: AppColor.primary,
            ),
            const SizedBox(height: AppSize.s16),
            Text(message, textAlign: TextAlign.center, style: appTextGray16),
            if (showRetry) ...[
              const SizedBox(height: AppSize.s16),
              PrimaryButton(title: 'Retry', onTap: onRetry!),
            ],
            if (secondaryAction != null) ...[
              const SizedBox(height: AppSize.s16),
              secondaryAction!,
            ],
          ],
        ),
      ),
    );
  }
}
