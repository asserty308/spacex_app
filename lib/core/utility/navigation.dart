import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/screens/webview_screen.dart';

void showScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context, 
    MaterialPageRoute(builder: (BuildContext context) => screen)
  );
}

void showWebView(BuildContext context, String url, String title) {
  showScreen(context, WebviewScreen(initialUrl: url, title: title,));
}