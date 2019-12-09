import 'package:intl/intl.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class Launch {
  Launch({
    this.flightNumber,
    this.missionName,
    this.launchDate,
    this.details,
    this.tentativeMaxPrecision,
    this.isTentative,
    this.launchSuccess,
    this.missionPatch,
    this.presskit,
    this.videoLink,
    this.youtubeID,
    this.rocket,
    this.flickrImages,
    this.upcoming,
    this.launchSiteName,
  });

  int flightNumber;
  DateTime launchDate;
  String missionName, details, tentativeMaxPrecision;
  bool isTentative, launchSuccess, upcoming;
  String missionPatch, presskit, videoLink, youtubeID, launchSiteName;
  Rocket rocket;
  List<String> flickrImages;

  static Launch fromJSON(Map<String, dynamic> json) {
    final rocket = Rocket.fromJSON(json['rocket']);
    final links = json['links'];
    final images = links['flickr_images'];

    final launchDateUnix = json['launch_date_unix'];

    return Launch(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      launchDate: DateTime.fromMillisecondsSinceEpoch(launchDateUnix * 1000),
      rocket: rocket,
      details: json['details'],
      tentativeMaxPrecision: json['tentative_max_precision'],
      isTentative: json['is_tentative'],
      launchSuccess: json['launch_success'],
      missionPatch: links['mission_patch'],
      presskit: links['presskit'],
      videoLink: links['video_link'],
      youtubeID: links['youtube_id'],
      flickrImages: List<String>.from(images),
      upcoming: json['upcoming'],
      launchSiteName: json['launch_site']['site_name']
    );
  }

  /// Converts the unix timestamp of the launch to a human readable string.
  /// The time will always be set to the devices locale.
  String formattedLaunchDate([String format = 'dd.MM.yyyy HH:mm:ss']) {
    if (isTentative) {
      switch (tentativeMaxPrecision) {
        case 'year':
          return DateFormat('yyyy').format(launchDate);
        case 'month':
          return DateFormat('MMMM yyyy').format(launchDate);
        case 'day':
          return DateFormat('dd.MM.yyyy').format(launchDate);
        default:
      }
    }

    return DateFormat(format).format(launchDate);
  }
}