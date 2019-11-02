import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/widgets/launch_images.dart';

class PastLaunchScreenArguments {
  PastLaunchScreenArguments(this.launch);

  Launch launch;
}

class PastLaunchScreen extends StatefulWidget {
  @override
  _PastLaunchScreenState createState() => _PastLaunchScreenState();
}

class _PastLaunchScreenState extends State<PastLaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final PastLaunchScreenArguments args = ModalRoute.of(context).settings.arguments;
    final launch = args.launch;

    return Scaffold(
      appBar: AppBar(
        title: Text(launch.missionName),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            children: <Widget>[
              LaunchImages(
                imageUrls: launch.flickrImages,
              ),
              Text(
                launch.missionName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                launch.formattedLaunchDate(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                launch.rocket.name,
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
}