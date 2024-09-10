import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class Webview extends StatefulWidget {
  const Webview({
    super.key,
    required this.url,
  });
  final String url;

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late WebViewController controller;
  bool isLoading = true; // Add a boolean variable to track the loading state
  Timer? timer; // Add a Timer variable to periodically refresh the WebView

  @override
  void initState() {
    super.initState();
    initWebViewController();
    startAutoRefresh(); // Start the auto-refresh timer
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (isLoading) // Show the loading indicator conditionally
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  // Initialize the WebView controller
  void initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading =
                  true; // Set loading state to true when the page starts loading
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading =
                  false; // Set loading state to false when the page finishes loading
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  // Start a timer to auto-refresh the WebView periodically
  void startAutoRefresh() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      controller.reload(); // Reload the WebView
    });
  }
}
