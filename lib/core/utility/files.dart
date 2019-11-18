import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<File> createFileFromUrl(String url) async {
  final filename = url.substring(url.lastIndexOf('/') + 1);
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();
  final bytes = await consolidateHttpClientResponseBytes(response);
  final dir = (await getApplicationDocumentsDirectory()).path;
  final file = File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}