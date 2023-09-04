import 'package:flutter/material.dart';
import 'package:spacex_guide/app/dependencies/app_dependencies.dart';
import 'package:spacex_guide/app/ui/screens/app.dart';

void main() {
  AppDependencies.register();
  
  runApp(const MyApp());
}
