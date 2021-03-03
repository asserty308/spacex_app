import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  WebviewScreen({
    Key? key, 
    required this.title,
    required this.initialUrl, 
  }) : super(key: key);

  final String? title, initialUrl;

  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar as PreferredSizeWidget?,
    body: _body,
  );

  // Widgets

  Widget get _appBar => AppBar(
    title: Text(title!),
  );

  Widget get _body => WebView(
    initialUrl: initialUrl!.replaceFirst('http://', 'https://'),
    gestureNavigationEnabled: true,
    onWebViewCreated: (webViewController) {
      _controller.complete(webViewController);
    },
    onPageStarted: (url) {
      print('$url loading');
    },
    onPageFinished: (url) {
      print('$url finished loading');
    },
    onWebResourceError: (error) {
      print('WebView error occured: $error');
    },
  );
}