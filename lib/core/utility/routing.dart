import 'package:flutter/material.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:spacex_guide/core/ui/screens/webview_screen.dart';

void showWebView(BuildContext context, String url, String title) {
  showScreen(context, WebviewScreen(initialUrl: url, title: title,));
}