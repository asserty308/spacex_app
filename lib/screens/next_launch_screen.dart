import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/widgets/drawer.dart';

class NextLaunchScreen extends StatefulWidget {
  @override
  _NextLaunchScreenState createState() => _NextLaunchScreenState();
}

class _NextLaunchScreenState extends State<NextLaunchScreen> {
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
      appBar: AppBar(
        title: Text('Next Launch'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => scheduleReminder(),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _launch?.missionName ?? 'Loading upcoming mission...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _launch?.formattedLaunchDate() ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                _launch?.rocketName ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              )
            ],
          ),
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
  void scheduleReminder() {

  }
}