import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/main.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/launch_countdown.dart';
import 'package:spacex_guide/widgets/launch_info.dart';

class NextLaunchScreen extends StatefulWidget {
  @override
  _NextLaunchScreenState createState() => _NextLaunchScreenState();
}

class _NextLaunchScreenState extends State<NextLaunchScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Launch _launch;

  @override
  void initState() {
    super.initState();

    // run 'afterFirstlayout' after first build()
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Next Launch'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => scheduleReminder(context),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: _launch == null ? Center(child: CircularProgressIndicator()) : LaunchInfo(
          launch: _launch,
        ),
      ),
    );
  }

  void afterFirstLayout(BuildContext context) {
    fetchLaunchInformation();
  }

  void fetchLaunchInformation() async {
    final api = SpaceXAPI();
    final launch = await api.getNextLaunch();

    setState(() {
      _launch = launch;
    });
  }

  /// Schedules a notification that appears one hour before takeoff
  void scheduleReminder(BuildContext context) async {
    final scheduledDate = DateTime.now().add(Duration(seconds: 15));
    final androidDetails = AndroidNotificationDetails('launch_reminder', 'Launch Reminder', 'Reminds you about a SpaceX launch');
    final iOSDetails = IOSNotificationDetails();
    final notificationDetails = NotificationDetails(androidDetails, iOSDetails);

    await globalLocalNotifications.schedule(
      0, 
      'Launch Reminder', 
      'The mission ${_launch.missionName} will launch soon!', 
      scheduledDate, notificationDetails,
    );

    _scaffoldKey.currentState
      .showSnackBar(
        SnackBar(
          content: Text('Set reminder for ${_launch.missionName}'),
        )
      );
  }
}