import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/utility/dialogs.dart';
import 'package:spacex_guide/widgets/launch_images.dart';
import 'package:spacex_guide/widgets/launch_info.dart';

import '../main.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatefulWidget {
  LaunchDetailScreen([this._launch]);

  final Launch _launch;

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var imageUrls = widget._launch?.getImageUrls() ?? List();
    var appBarActions = List<Widget>();
    
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
      appBar: AppBar(
        title: Text(widget._launch?.missionName),
        backgroundColor: Colors.black,
        actions: appBarActions,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            children: <Widget>[
              // show imageview only when images are available
              imageUrls.isEmpty ? Container() : LaunchImages(
                imageUrls: imageUrls,
              ),
              Expanded(
                child: LaunchInfo(
                  launch: widget._launch,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Schedules a notification that appears two hours before launch
  void scheduleReminder(BuildContext context) async {
    final prefKey = 'notif_scheduled_${widget._launch.flightNumber}';

    if (sharedPrefs.getBool(prefKey) ?? false) {
      showOKDialog(context, 'Already set', 'A scheduled notification for this launch has already been set.');
      return;
    }

    if (widget._launch.isTentative) {
      showOKDialog(context, 'Not available', 'The reminder cannot be set because the launch time is not final. Please try again later.');
      return;
    }

    final launchDate = widget._launch.getLaunchDate();
    final scheduledDate = launchDate.subtract(Duration(hours: 2));
    final androidDetails = AndroidNotificationDetails('launch_reminder', 'Launch Reminder', 'Reminds you about a SpaceX launch');
    final iOSDetails = IOSNotificationDetails();
    final notificationDetails = NotificationDetails(androidDetails, iOSDetails);

    await globalLocalNotifications.schedule(
      widget._launch.flightNumber,
      'Launch Reminder', 
      'The mission ${widget._launch.missionName} will launch soon!', 
      scheduledDate, notificationDetails,
    );

    await sharedPrefs.setBool(prefKey, true);

    _scaffoldKey.currentState
      .showSnackBar(
        SnackBar(
          content: Text('Reminder will appear two hours before launch'),
        )
      );
  }
}