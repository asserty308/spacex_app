import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/screens/webview_screen.dart';

void showWebView(BuildContext context, String url, String title) {
  Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, a1, a2) => WebviewScreen(initialUrl: url, title: title,)));
}