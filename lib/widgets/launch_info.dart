import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/utility/dialogs.dart';
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
    showOKDialog(context, launch.missionName, launch.details);
  }

  void showPresskit(BuildContext context) {
    // TODO: Implement showPresskit
    showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.');
  }

  void showVideo(BuildContext context) {
    // TODO: Implement showVideo
    showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
  }
}