import 'package:flutter/material.dart';
import 'package:spacex_guide/core/dependencies/providers/app_provider.dart';
import 'package:spacex_guide/core/dependencies/singletons/app_singletons.dart';

void main() {
  AppSingletons.register();
  
  runApp(AppProvider());
}
