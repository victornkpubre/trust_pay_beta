import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';

/// A slim error strip for a screen that still has content worth keeping on
/// screen (e.g. a chat whose last send failed) — message plus Retry, instead
/// of replacing everything with a full error view.
class InlineErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const InlineErrorBanner({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s8),
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s4),
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Row(
        children: [
          Icon(
            message == ErrorMessages.noConnection ? Icons.wifi_off : Icons.error_outline,
            size: 20,
            color: AppColor.primary,
          ),
          const SizedBox(width: AppSize.s8),
          Expanded(child: Text(message, style: appTextGray16)),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
