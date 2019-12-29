import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/screens/webview_screen.dart';
import 'package:spacex_guide/core/utility/no_animation_material_page_route.dart';

void showScreen(BuildContext context, Widget screen, {bool animated = false}) {
  Navigator.push(
    context, 
    animated ? MaterialPageRoute(builder: (_) => screen) : NoAnimationMaterialPageRoute(builder: (_) => screen)
  );
}

void showWebView(BuildContext context, String url, String title) {
  showScreen(context, WebviewScreen(initialUrl: url, title: title,));
}