//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  ConnectivityPlugin.registerWith(registry.registrarFor(ConnectivityPlugin));
  FirebaseCoreWeb.registerWith(registry.registrarFor(FirebaseCoreWeb));
  UrlLauncherPlugin.registerWith(registry.registrarFor(UrlLauncherPlugin));
  registry.registerMessageHandler();
}
