import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/views/payment/payment_pending_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Hosts Paystack's/Stripe's own checkout page — the app never collects
/// card or bank details itself. Watches for navigation back to the shared
/// `payment/callback` URL to know the checkout flow finished, then hands
/// off to PaymentPendingView (the webhook is the actual source of truth,
/// this is just a UI signal that the user is done on the gateway's page).
class HostedCheckoutView extends StatefulWidget {
  final String checkoutLink;
  final int paymentId;
  // Called once the top-up itself is confirmed successful — used when this
  // checkout was opened to cover a shortfall for some other action (e.g.
  // paying an obligation), so that action can complete automatically
  // instead of the user having to notice and retry it themselves.
  final VoidCallback? onSettled;

  const HostedCheckoutView({
    super.key,
    required this.checkoutLink,
    required this.paymentId,
    this.onSettled,
  });

  @override
  State<HostedCheckoutView> createState() => _HostedCheckoutViewState();
}

class _HostedCheckoutViewState extends State<HostedCheckoutView> {
  late final WebViewController _controller;
  bool _loading = true;
  bool _handedOff = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => _maybeHandOff(url),
          onPageFinished: (url) {
            if (mounted) setState(() => _loading = false);
            _maybeHandOff(url);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutLink));
  }

  void _maybeHandOff(String url) {
    if (_handedOff || !url.startsWith(AppConstants.paymentCallbackUrl)) {
      return;
    }
    _handedOff = true;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => PaymentPendingView(
          paymentId: widget.paymentId,
          onSettled: widget.onSettled,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            const Positioned(top: 8, left: 8, child: AppBackButton(size: AppSize.s16)),
            if (_loading) const Center(child: AppCircleProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
