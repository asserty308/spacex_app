import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/screens/all_launches_screen.dart';
import 'package:spacex_guide/screens/launch_screen.dart';

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
      title: 'Ranking App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: AllLaunchesScreen(),
    );
  }

  void initLocalNotifications() async {
    globalLocalNotifications = FlutterLocalNotificationsPlugin();

    // Platform specific setup
    final androidSettings = AndroidInitializationSettings('app_icon');
    final iosSettings = IOSInitializationSettings();
    final settings = InitializationSettings(androidSettings, iosSettings);

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

  Future onSelectNotification(String payload) async {
    print('Did select notification with payload $payload');
  }
}