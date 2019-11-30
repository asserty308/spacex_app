import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/pdf_screen.dart';
import 'package:spacex_guide/core/utility/dialogs.dart';
import 'package:spacex_guide/core/utility/files.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_action_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    if (launch.presskit == null || launch.presskit.isEmpty || !launch.presskit.endsWith('.pdf')) {
      showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.');
      return;
    }

    final file = await createFileFromUrl(launch.presskit);

    showScreen(context, PDFScreen(
      title: '${launch.missionName} Presskit', 
      filePath: file.path
    ));
  }

  void playVideo(BuildContext context) {
    if (launch.youtubeID == null || launch.youtubeID.isEmpty) {
      showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.');
      return;
    }

    // TODO: Some videos throw error code 150 which means that the uploader didn't allow embedding.
    final _controller = YoutubePlayerController(
        initialVideoId: launch.youtubeID,
        flags: const YoutubePlayerFlags(
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