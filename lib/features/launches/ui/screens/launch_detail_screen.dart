import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/core/utility/dialogs.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';
import 'package:spacex_guide/main.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatefulWidget {
  const LaunchDetailScreen([this._launch]);

  final Launch _launch;

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget._launch?.flickrImages ?? [];
    final appBarActions = <Widget>[];
    
    if (widget._launch?.isUpcoming() == true) {
      appBarActions.add(
        IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () => scheduleReminder(context),
          )
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.black,
              actions: appBarActions,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  widget._launch?.missionName,
                ),
                background: ImageCarousel(
                  imageUrls: imageUrls,
                ),
              ),
            )
          ];
        },
        body: Container(
          color: Colors.black87,
          child: LaunchInfo(
            launch: widget._launch,
          ),
        )
      ),
    );
  }

  /// Schedules a notification that appears two hours before launch
  Future<void> scheduleReminder(BuildContext context) async {
    // TODO: Option to cancel a scheduled notification through the scaffold as well as through the icon
    final prefKey = 'notif_scheduled_${widget._launch.flightNumber}';

    if (sharedPrefs.getBool(prefKey) ?? false) {
      showOKDialog(context, 'Already set', 'A scheduled notification for this launch has already been set.');
      return;
    }

    if (widget._launch.isTentative) {
      showOKDialog(context, 'Not available', 'The reminder cannot be set because the launch time is not final. Please try again later.');
      return;
    }

    final launchDate = widget._launch.launchDate;
    var scheduledDate = launchDate.subtract(Duration(hours: 2));

    // When the user schedules a notification less than 2hr before takeoff, 
    // the notification will appear 15min before launch.
    // After T-15min the user won't be able to set a notification
    if (scheduledDate.isAfter(launchDate)) {
      scheduledDate = launchDate.subtract(Duration(minutes: 15));

      if (scheduledDate.isAfter(launchDate)) {
        showOKDialog(context, 'The launch will begin soon', 'Watch the live broadcast now by pressing the button below!');
        return;
      }
    }

    // Schedule notification and show snackbar

    final androidDetails = AndroidNotificationDetails('launch_reminder', 'Launch Reminder', 'Reminds you about a SpaceX launch');
    final iOSDetails = IOSNotificationDetails();
    final notificationDetails = NotificationDetails(androidDetails, iOSDetails);

    await globalLocalNotifications.schedule(
      widget._launch.flightNumber,
      'Launch Reminder', 
      'The mission ${widget._launch.missionName} will launch soon!', 
      scheduledDate, 
      notificationDetails,
    );

    await sharedPrefs.setBool(prefKey, true);

    showTextSnackbar(_scaffoldKey, 'Reminder set for the ${widget._launch.missionName} launch');
  }
}