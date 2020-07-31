import 'package:flutter/material.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:spacex_guide/core/ui/screens/pdf_screen.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_action_button.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class LaunchDetailActions extends StatelessWidget {
  const LaunchDetailActions({
    Key key,
    this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LaunchDetailActionButton(
          icon: Icon(Icons.ondemand_video), 
          onTap: () => playVideo(context),
        ),
        LaunchDetailActionButton(
          icon: Icon(Icons.insert_drive_file), 
          onTap: () => showPresskit(context),
        ),
      ],
    );
  }

  Future<void> showPresskit(BuildContext context) async {
    if (launch.presskit == null || launch.presskit.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.');
      return;
    }

    //if (await url_launcher.canLaunch(launch.presskit)) {
    //  await url_launcher.launch(launch.presskit));
    //}

    showScreen(context, PDFScreen(
      title: '${launch.missionName} Presskit', 
      url: launch.presskit
    ));
  }

  Future<void> playVideo(BuildContext context) async {
    if (launch.youtubeID == null || launch.youtubeID.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
      return;
    }

    // When youtube app is installed open the video there
    final url = launch.videoLink;

    if (await url_launcher.canLaunch(url)) {
      await url_launcher.launch(url);
    }
  }
}