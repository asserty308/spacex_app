import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_events.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_states.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_states.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/core/utility/notifications.dart';
import 'package:spacex_guide/features/history/ui/screens/all_events_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/launches_master_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/upcoming_launches_screen.dart';
import 'package:spacex_guide/features/launchpads/ui/screens/all_launchpads_screen.dart';
import 'package:spacex_guide/features/rockets/ui/screens/all_rockets_screen.dart';
import 'package:spacex_guide/features/splash/ui/screens/splash_screen.dart';

FlutterLocalNotificationsPlugin globalLocalNotifications;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initLocalNotifications();
    BlocProvider.of<AllDataBloc>(context).add(GetAllData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: _dataListener,
    );
  }

  Widget get _dataListener => BlocListener<AllDataBloc, AllDataState>(
    listener: (context, state) {
      if (state is AllDataStateLoaded) {
        // Schedule notifications for all upcoming launches
        scheduleReminders(context, globalLaunchData);
      }
    },
    child: _navigationBuilder,
  );

  Widget get _navigationBuilder => BlocBuilder<AppNavigationBloc, AppNavigationState>(
    builder: (context, state) {
      if (state is AppNavigationStateSplash) {
        return SplashScreen();
      }

      if (state is AppNavigationStateLaunches) {
        return LaunchesMasterScreen();
      }

      if (state is AppNavigationStateHistory) {
        return AllEventsScreen();
      }

      if (state is AppNavigationStateRockets) {
        return AllRocketsScreen();
      }

      if (state is AppNavigationStateLaunchpads) {
        return AllLaunchpadsScreen();
      }

      return Container();
    },
  );

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