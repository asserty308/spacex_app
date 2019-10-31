import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex_guide/api/spacex_api.dart';

class NextLaunchScreen extends StatefulWidget {
  @override
  _NextLaunchScreenState createState() => _NextLaunchScreenState();
}

class _NextLaunchScreenState extends State<NextLaunchScreen> {
  var _launchName = 'Loading launch information...';
  var _launchDate = '';
  var _rocket = '';

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
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                _launchName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _launchDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                _rocket,
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
    final response = await api.getNextLaunch();

    final date = DateTime.fromMillisecondsSinceEpoch(response['launch_date_unix'] * 1000);
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm:ss').format(date);

    setState(() {
      _launchName = response['mission_name'];
      _launchDate = dateFormat;
      _rocket = response['rocket']['rocket_name'];
    });
  }
}