import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/main.dart';
import 'package:flutter_core/utility/extensions/int_duration.dart';

/// Schedules a notification for all upcoming launches
Future<void> scheduleReminders(BuildContext context, List<Launch> launches) async {
  // needed to update already scheduled notifications
  globalLocalNotifications.cancelAll();

  final upcoming = launches.where((l) => l.upcoming).toList();

  for (final launch in upcoming) {
    await _scheduleLaunchReminder(context, launch);
  }
}

Future<void> _scheduleLaunchReminder(BuildContext context, Launch launch) async {
  if (launch.isTentative) {
    return;
  }

  final launchDate = launch.launchDate;
  final schedule2hr = launchDate.subtract(2.toHours());
  final schedule15min = launchDate.subtract(15.toMinutes());

  final androidDetails = AndroidNotificationDetails('launch_reminder', 'Launch Reminder', 'Reminds you about a SpaceX launch');
  final iOSDetails = IOSNotificationDetails();
  final notificationDetails = NotificationDetails(androidDetails, iOSDetails);

  // both ids must differ but stay the same for each app launch
  var id2hr = int.tryParse('2${launch.flightNumber}');
  var id15min = int.tryParse('15${launch.flightNumber}');

  if (id2hr == null || id15min == null) {
    // should not happen but if it does show only 15 min message
    id2hr = launch.flightNumber;
    id15min = launch.flightNumber;
  }

  // Schedule notification for 2hr before launch
  await globalLocalNotifications.schedule(
    id2hr,
    'Launch Reminder', 
    'The mission ${launch.missionName} will launch in 2 hours!', 
    schedule2hr, 
    notificationDetails,
  );

  // Schedule notification for 15min before launch
  await globalLocalNotifications.schedule(
    id15min,
    'Launch Reminder', 
    'The mission ${launch.missionName} will launch in 15 minutes. Watch the broadcast now in the app!', 
    schedule15min, 
    notificationDetails,
  );
}