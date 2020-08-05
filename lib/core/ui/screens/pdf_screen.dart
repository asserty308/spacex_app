// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
// import 'package:flutter_core/utility/files.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';

// class PDFScreen extends StatefulWidget {
//   const PDFScreen({this.title, this.url});

//   final String title, url;

//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> {
//   File _file;
  
//   @override
//   void initState() {
//     super.initState();
    
//     // run 'afterFirstlayout' after first build()
//     WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstlayout(context));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       title: Text(widget.title),
//     );

//     return _file == null ? AppScaffold(title: Text(widget.title), child: CenterProgressIndicator(),) : PDFViewerScaffold(
//       appBar: appBar,
//       path: _file.path,
//     );
//   }

//   void afterFirstlayout(BuildContext context) {
//     loadPDF();
//   }

//   Future<void> loadPDF() async {
//     _file = await createFileFromUrl(widget.url);
//     setState(() {});
//   }
// }