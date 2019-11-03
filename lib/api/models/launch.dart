import 'package:intl/intl.dart';
import 'package:spacex_guide/api/models/rocket.dart';

class Launch {
  Launch({
    this.flightNumber,
    this.missionName,
    this.launchDateUnix,
    this.details,
    this.missionPatch,
    this.presskit,
    this.videoLink,
    this.rocket,
    this.flickrImages,
  });

  int flightNumber, launchDateUnix;
  String missionName, details;
  String missionPatch, presskit, videoLink;
  Rocket rocket;
  List<String> flickrImages;


  static Launch fromJSON(Map<String, dynamic> json) {
    final rocket = Rocket.fromJSON(json['rocket']);
    final links = json['links'];
    final flickrImages = links['flickr_images'];

    return Launch(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      launchDateUnix: json['launch_date_unix'],
      rocket: rocket,
      details: json['details'],
      missionPatch: links['mission_patch'],
      presskit: links['presskit'],
      videoLink: links['video_link'],
      flickrImages: List<String>.from(flickrImages),
    );
  }
  
  bool isUpcoming() {
    return (launchDateUnix * 1000) > DateTime.now().millisecondsSinceEpoch;
  }

  /// Converts the unix timestamp of the launch to a human readable string.
  /// The time will always be set to the devices locale.
  String formattedLaunchDate([String format = 'dd.MM.yyyy HH:mm:ss']) {
    final date = DateTime.fromMillisecondsSinceEpoch(launchDateUnix * 1000);
    return DateFormat(format).format(date);
  }
}