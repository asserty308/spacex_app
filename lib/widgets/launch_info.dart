import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/screens/pdf_screen.dart';
import 'package:spacex_guide/screens/video_screen.dart';
import 'package:spacex_guide/utility/dialogs.dart';
import 'package:spacex_guide/utility/files.dart';
import 'package:spacex_guide/widgets/launch_countdown.dart';

class LaunchInfo extends StatelessWidget {
  LaunchInfo({this.launch});

  Launch launch;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        !launch.isUpcoming() ? Container() : Center(child: LaunchCountdown(launch: launch,)),
        ListTile(
          title: Text(
            'Mission name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.missionName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.formattedLaunchDate(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Rocket',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.rocket.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () => showLaunchDetails(context),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white30,
            size: 18,
          ),
        ),
        ListTile(
          title: Text(
            'Presskit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () => showPresskit(context),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white30,
            size: 18,
          ),
        ),
        ListTile(
          title: Text(
            'Video',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () => showVideo(context),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white30,
            size: 18,
          ),
        ),
      ],
    );
  }

  void showLaunchDetails(BuildContext context) {
    var content = launch.details != null ? launch.details : 'There are no details available.';
    showOKDialog(context, launch.missionName, content);
  }

  void showPresskit(BuildContext context) async {
    if (launch.presskit == null || launch.presskit.isEmpty || !launch.presskit.endsWith('.pdf')) {
      showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.');
      return;
    }

    File file = await createFileFromUrl(launch.presskit);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PDFScreen(
        title: '${launch.missionName} Presskit', 
        filePath: file.path
      )),
    );
  }

  void showVideo(BuildContext context) {
    if (launch.youtubeID == null || launch.youtubeID.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoScreen(launch)),
    );
  }
}