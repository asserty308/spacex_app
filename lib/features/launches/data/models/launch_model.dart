import 'package:spacex_guide/features/launches/domain/entities/launch.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class LaunchModel extends Launch {
  LaunchModel({
    flightNumber,
    missionName,
    launchDateUnix,
    details,
    tentativeMaxPrecision,
    isTentative,
    missionPatch,
    presskit,
    videoLink,
    youtubeID,
    rocket,
    flickrImages,
  }) : super(flightNumber: flightNumber, missionName: missionName, launchDateUnix: launchDateUnix, details: details,
    tentativeMaxPrecision: tentativeMaxPrecision, isTentative: isTentative, missionPatch: missionPatch, presskit: presskit,
    videoLink: videoLink, youtubeID: youtubeID, rocket: rocket, flickrImages: flickrImages
  );

  static LaunchModel fromJSON(Map<String, dynamic> json) {
    final rocket = Rocket.fromJSON(json['rocket']);
    final links = json['links'];
    final flickrImages = links['flickr_images'];

    return LaunchModel(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      launchDateUnix: json['launch_date_unix'],
      rocket: rocket,
      details: json['details'],
      tentativeMaxPrecision: json['tentative_max_precision'],
      isTentative: json['is_tentative'],
      missionPatch: links['mission_patch'],
      presskit: links['presskit'],
      videoLink: links['video_link'],
      youtubeID: links['youtube_id'],
      flickrImages: List<String>.from(flickrImages),
    );
  }
}