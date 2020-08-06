import 'package:flutter/material.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_action_button.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class LaunchDetailActions extends StatelessWidget {
  const LaunchDetailActions({
    Key key,
    this.launch,
  }) : super(key: key);

  final LaunchModel launch;

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
    final presskit = launch.links.presskit;
    if (presskit == null || presskit.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.');
      return;
    }

    if (await url_launcher.canLaunch(presskit)) {
      await url_launcher.launch(presskit);
    }

    // showScreen(context, PDFScreen(
    //   title: '${launch.name} Presskit', 
    //   url: presskit
    // ));
  }

  Future<void> playVideo(BuildContext context) async {
    final webcast = launch.links.webcast;
    if (webcast == null || webcast.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
      return;
    }

    if (await url_launcher.canLaunch(webcast)) {
      await url_launcher.launch(webcast);
    }
  }
}