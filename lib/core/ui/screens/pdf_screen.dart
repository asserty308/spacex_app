import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({this.title, this.filePath});

  final String title, filePath;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      path: filePath,
    );
  }
}