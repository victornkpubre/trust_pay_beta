import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';

void showSnackBar({required BuildContext context, required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating, // Ensures transparency works properly
      elevation: 0, // Removes shadow
      content: IgnorePointer( // Prevents interaction blocking
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSize.s16),
            Stack(
              children: [
                Positioned(
                  right: 8,
                  top: 8,
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                    child: Icon(Icons.cancel_outlined, color: AppColor.white, size: AppSize.s32),
                  ),
                ),
                Container(
                  color: AppColor.primary, // Visible background inside the SnackBar
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: Text(
                      message,
                      style: appTextWhite20Bold.copyWith(overflow: TextOverflow.visible),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 8),
    ),
  );
}

/// An error snackbar for a failed action. Shows a Retry action when
/// [onRetry] is given and the failure is retryable (no internet, timeout,
/// server error) — otherwise it's a plain message, since retrying e.g.
/// "Insufficient balance" wouldn't help.
void showErrorSnackBar({required BuildContext context, required String message, VoidCallback? onRetry}) {
  final showRetry = onRetry != null && isRetryableMessage(message);
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.primary,
        content: Text(message, style: appTextWhite14Bold),
        duration: Duration(seconds: showRetry ? 10 : 6),
        action: showRetry
            ? SnackBarAction(label: 'Retry', textColor: AppColor.white, onPressed: onRetry)
            : null,
      ),
    );
}

/// Whether this screen is the top route. A screen-level error listener uses
/// it to stay quiet while a popup it opened is showing that error itself.
bool isScreenOnTop(BuildContext context) => ModalRoute.of(context)?.isCurrent ?? true;

void toast(String message) {
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    webBgColor: "white",
    fontSize: FontSize.s14,
    backgroundColor: AppColor.primary,
    toastLength: Toast.LENGTH_LONG,
    msg: message
  );
}

