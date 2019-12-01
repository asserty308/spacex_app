import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({
    this.initialUrl,
    this.title,
  });

  final String initialUrl, title;

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  bool _urlLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
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
          Center(child: const CircularProgressIndicator(),),
        ]
      ),
    );
  }
}