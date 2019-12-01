import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/webview_page.dart';

void showScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context, 
    MaterialPageRoute(builder: (BuildContext context) => screen)
  );
}

void showWebView(BuildContext context, String url, String title) {
  showScreen(context, WebviewPage(initialUrl: url, title: title,));
}