import 'package:flutter/material.dart';
import 'package:spacex_guide/core/dependencies/providers/app_provider.dart';
import 'package:spacex_guide/core/dependencies/singletons/app_dependencies.dart';

void main() {
  AppDependencies.register();
  
  runApp(AppProvider());
}
