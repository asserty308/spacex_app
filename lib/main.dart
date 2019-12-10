//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/features/launches/ui/screens/all_launches_screen.dart';

FlutterLocalNotificationsPlugin globalLocalNotifications;
SharedPreferences sharedPrefs;

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
    initSharedPrefs();
    //initCrashlytics();
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
    globalLocalNotifications = FlutterLocalNotificationsPlugin();

    // Platform specific setup
    const androidSettings = AndroidInitializationSettings('notification_icon');
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

  Future<void> initSharedPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  /*void initCrashlytics() {
    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = Crashlytics.instance.recordFlutterError;
  }*/
}