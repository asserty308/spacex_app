import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen(this.launch);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    // TODO: Some videos throw error code 150 which means that the uploader didn't allow embedding.
    final _controller = YoutubePlayerController(
        initialVideoId: launch.youtubeID,
        flags: YoutubePlayerFlags(
            autoPlay: true,
        ),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.launch.missionName} Video'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
      )
    );
  }
}