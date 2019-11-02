import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/widgets/launch_images.dart';
import 'package:spacex_guide/widgets/drawer.dart';

class PastLaunchScreen extends StatefulWidget {
  @override
  _PastLaunchScreenState createState() => _PastLaunchScreenState();
}

class _PastLaunchScreenState extends State<PastLaunchScreen> {
  Launch _launch;
  List<String> _launchImages = List();

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
        title: Text(_launch?.missionName ?? 'Loading...'),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            children: <Widget>[
              LaunchImages(
                imageUrls: _launchImages,
              ),
              Text(
                _launch?.missionName ?? '',
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
                _launch?.rocket?.name ?? '',
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
    final launch = await api.getLatestLaunch();

    setState(() {
      _launch = launch;
      _launchImages = launch.flickrImages;
    });
  }
}