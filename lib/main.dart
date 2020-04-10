import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/features/launches/ui/screens/all_launches_screen.dart';

FlutterLocalNotificationsPlugin globalLocalNotifications;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initLocalNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: AllLaunchesScreen(),
    );
  }

  Future<void> initLocalNotifications() async {
    // do not use on web
    if (kIsWeb) {
      return;
    }

    globalLocalNotifications = FlutterLocalNotificationsPlugin();

    // Platform specific setup
    const androidSettings = AndroidInitializationSettings('ic_launcher');
    const iosSettings = IOSInitializationSettings();
    const settings = InitializationSettings(androidSettings, iosSettings);

    globalLocalNotifications.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );

    // Fetch app launch details when the app was launced by a notification
    final launchDetails = await globalLocalNotifications.getNotificationAppLaunchDetails();

    if (launchDetails.didNotificationLaunchApp) {
      onSelectNotification(launchDetails.payload);
    }
  }

  /// Callback for both foreground and background
  Future onSelectNotification(String payload) async {
    print('Did select notification with payload $payload');
  }
}