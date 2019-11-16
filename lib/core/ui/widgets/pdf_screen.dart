import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFScreen extends StatelessWidget {
  PDFScreen({this.title, this.filePath});

  final String title, filePath;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.black,
      ),
      path: this.filePath,
    );
  }
}