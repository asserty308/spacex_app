import 'package:flutter/material.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({
    this.initialUrl,
    this.title,
  });

  final String initialUrl, title;

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  bool _urlLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _urlLoaded ? 0 : 1,
        children: <Widget>[
          WebView(
            initialUrl: widget.initialUrl,
            onPageFinished: (_) {
              setState(() {
                _urlLoaded = true;
              });
            },
          ),
          CenterProgressIndicator(),
        ]
      ),
    );
  }
}