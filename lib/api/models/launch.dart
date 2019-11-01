import 'package:intl/intl.dart';

class Launch {
  Launch({
    this.flightNumber,
    this.missionName,
    this.launchDateUnix,
    this.rocketName, // TODO: Update to model Rocket
  });

  int flightNumber;
  String missionName, rocketName;
  int launchDateUnix;

  static Launch fromJSON(Map<String, dynamic> json) {
    return Launch(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      launchDateUnix: json['launch_date_unix'],
      rocketName: json['rocket']['rocket_name'],
    );
  }

  /// Converts the unix timestamp of the launch to a human readable string.
  /// The time will always be set to the devices locale.
  String formattedLaunchDate([String format = 'dd.MM.yyyy HH:mm:ss']) {
    final date = DateTime.fromMillisecondsSinceEpoch(launchDateUnix * 1000);
    return DateFormat(format).format(date);
  }
}