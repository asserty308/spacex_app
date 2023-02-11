import 'package:flutter/material.dart';
import 'package:spacex_guide/core/dependencies/app_dependencies.dart';
import 'package:spacex_guide/core/ui/screens/app.dart';

void main() {
  AppDependencies.register();
  
  runApp(const MyApp());
}
