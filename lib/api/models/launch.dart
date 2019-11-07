import 'package:intl/intl.dart';
import 'package:spacex_guide/api/models/rocket.dart';

class Launch {
  Launch({
    this.flightNumber,
    this.missionName,
    this.launchDateUnix,
    this.details,
    this.tentativeMaxPrecision,
    this.isTentative,
    this.missionPatch,
    this.presskit,
    this.videoLink,
    this.youtubeID,
    this.rocket,
    this.flickrImages,
  });

  int flightNumber, launchDateUnix;
  String missionName, details, tentativeMaxPrecision;
  bool isTentative;
  String missionPatch, presskit, videoLink, youtubeID;
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
      tentativeMaxPrecision: json['tentative_max_precision'],
      isTentative: json['is_tentative'],
      missionPatch: links['mission_patch'],
      presskit: links['presskit'],
      videoLink: links['video_link'],
      youtubeID: links['youtube_id'],
      flickrImages: List<String>.from(flickrImages),
    );
  }
  
  bool isUpcoming() {
    return (launchDateUnix * 1000) > DateTime.now().millisecondsSinceEpoch;
  }

  DateTime getLaunchDate() {
    return DateTime.fromMillisecondsSinceEpoch(launchDateUnix * 1000);
  }

  /// Converts the unix timestamp of the launch to a human readable string.
  /// The time will always be set to the devices locale.
  String formattedLaunchDate([String format = 'dd.MM.yyyy HH:mm:ss']) {
    final date = getLaunchDate();

    if (isTentative) {
      switch (tentativeMaxPrecision) {
        case "year":
          return DateFormat('yyyy').format(date);
        case "month":
          return DateFormat('MMMM yyyy').format(date);
        case "day":
          return DateFormat('dd.MM.yyyy').format(date);
        default:
      }
    }

    return DateFormat(format).format(date);
  }

  /// Returns a list of the launch's image urls.
  /// Contains all flickr images as well as the mission patch (when available).
  /// When the mission patch is available it will be located at position 0 of the list.
  List<String> getImageUrls() {
    var urls = List<String>.from(flickrImages);

    // the mission patch should always be the first image to show (when available)
    if (missionPatch != null && missionPatch.isNotEmpty) {
      urls.insert(0, missionPatch);
    }

    return urls;
  }
}