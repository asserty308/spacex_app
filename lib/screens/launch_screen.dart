import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/widgets/launch_images.dart';
import 'package:spacex_guide/widgets/launch_info.dart';

import 'arguments/launch_arguments.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  Launch _launch;

  @override
  Widget build(BuildContext context) {
    final LaunchScreenArguments args = ModalRoute.of(context).settings.arguments;
    _launch = args.launch;

    return Scaffold(
      appBar: AppBar(
        title: Text(_launch.missionName),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            children: <Widget>[
              LaunchImages(
                imageUrls: getImageUrls(),
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

  List<String> getImageUrls() {
    var urls = _launch.flickrImages;

    // the mission patch should always be the first image to show (when available)
    if (_launch.missionPatch != null && _launch.missionPatch.isNotEmpty) {
      urls.insert(0, _launch.missionPatch);
    }

    return urls;
  }
}