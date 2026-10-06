import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Function(String) onSaveWebsite;

  const WebViewScreen({super.key, required this.onSaveWebsite});
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  String _currentUrl = "https://www.google.com";
  final TextEditingController _searchController = TextEditingController();
  String _savedUrl = "";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) => _saveVisitedWebsite(),
        ),
      )
      ..loadRequest(Uri.parse("https://www.google.com"));
  }

  // Save the visited website URL
  void _saveVisitedWebsite() async {
    String? url = await _controller.currentUrl();
    if (url != null && url != _savedUrl) {
      setState(() {
        _savedUrl = url;
      });

      widget.onSaveWebsite(_savedUrl);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selected Website Saved")),
      );
    }
  }

  // Load a new URL
  void _loadUrl(String query) {
    if(query.length>2) {
      String url = query.contains(".")
          ? (query.startsWith("http") ? query : "https://$query")
          : "https://www.google.com/search?q=$query";

      setState(() {
        _currentUrl = url;
      });

      _controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Search Bar
          // AppSearchInput(
          //   borderColor: AppColor.secondary,
          //   hint: 'Search...',
          //   controller: _searchController,
          //   onChange: (value) => _loadUrl(value),
          // ),
          // const SizedBox(height: AppSize.s16),

          Divider(color: AppColor.primary, thickness: 2, height: 0),
          const SizedBox(height: AppSize.s8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Selected Website: ", style: appTextPrimary18Bold),
                Expanded( // Move Expanded here to prevent Row overflow
                  child: Text(
                    _savedUrl.isEmpty ? _currentUrl : _savedUrl,
                    overflow: TextOverflow.ellipsis, // Prevent text from overflowing
                    maxLines: 1, // Ensure it remains a single line
                    style: appTextPrimary18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s8),
          Divider(color: AppColor.primary, thickness: 2, height: 0),
          const SizedBox(height: AppSize.s16),

          // WebView Widget
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }
}