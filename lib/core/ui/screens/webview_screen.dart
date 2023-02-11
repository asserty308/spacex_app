import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  WebviewScreen({
    Key? key, 
    required this.title,
    required this.initialUrl, 
  }) : super(key: key) {
    _controller.loadRequest(Uri.parse(initialUrl));
  }

  final String title;
  final String initialUrl;

  final _controller = WebViewController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar,
    body: _body,
  );

  AppBar get _appBar => AppBar(
    title: Text(title),
  );

  Widget get _body => WebViewWidget(
    controller: _controller,
  );
}