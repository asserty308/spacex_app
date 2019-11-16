import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spacex_guide/core/dialogs.dart';
import 'package:spacex_guide/core/files.dart';
import 'package:spacex_guide/core/navigation.dart';
import 'package:spacex_guide/core/pdf_screen.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'launch_countdown_card.dart';

class LaunchInfo extends StatelessWidget {
  LaunchInfo({this.launch});

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        !launch.isUpcoming() ? Container() : LaunchCountdownCard(launch: launch),
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

    showScreen(context, PDFScreen(
      title: '${launch.missionName} Presskit', 
      filePath: file.path
    ));
  }

  void showVideo(BuildContext context) {
    if (launch.youtubeID == null || launch.youtubeID.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
      return;
    }

    // TODO: Some videos throw error code 150 which means that the uploader didn't allow embedding.
    final _controller = YoutubePlayerController(
        initialVideoId: launch.youtubeID,
        flags: YoutubePlayerFlags(
            autoPlay: true,
        ),
    );

    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: player,
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}