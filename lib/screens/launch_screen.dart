import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/utility/dialogs.dart';
import 'package:spacex_guide/widgets/launch_images.dart';
import 'package:spacex_guide/widgets/launch_info.dart';

import '../main.dart';
import 'arguments/launch_arguments.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Launch _launch;

  @override
  Widget build(BuildContext context) {
    final LaunchScreenArguments args = ModalRoute.of(context).settings.arguments;
    _launch = args.launch;

    var imageUrls = _launch.getImageUrls();
    var appBarActions = List<Widget>();
    
    if (_launch.isUpcoming()) {
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
        title: Text(_launch.missionName),
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
                  launch: _launch,
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
    if (_launch.isTentative) {
      showOKDialog(context, 'Not available', 'The reminder cannot be set because the launch time is not final. Please try again later.');
      return;
    }

    final launchDate = _launch.getLaunchDate();
    final scheduledDate = launchDate.subtract(Duration(hours: 2));
    final androidDetails = AndroidNotificationDetails('launch_reminder', 'Launch Reminder', 'Reminds you about a SpaceX launch');
    final iOSDetails = IOSNotificationDetails();
    final notificationDetails = NotificationDetails(androidDetails, iOSDetails);

    await globalLocalNotifications.schedule(
      _launch.flightNumber,
      'Launch Reminder', 
      'The mission ${_launch.missionName} will launch soon!', 
      scheduledDate, notificationDetails,
    );

    _scaffoldKey.currentState
      .showSnackBar(
        SnackBar(
          content: Text('Reminder will appear two hours before launch'),
        )
      );
  }
}