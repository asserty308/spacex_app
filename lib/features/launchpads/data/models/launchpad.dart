part 'launchpad_status.dart';

class LaunchpadModel {
  LaunchpadModel({
    this.id,
    this.name,
    this.fullName,
    this.status,
    this.locality,
    this.region,
    this.timezone,
    this.latitude,
    this.longitude,
    this.launchAttempts,
    this.launchSuccesses,
    this.rockets,
    this.launches,
  });

  final int? launchAttempts, launchSuccesses;
  final String? id, name, fullName, locality, region, timezone;
  final LaunchpadStatus? status;
  final num? latitude, longitude;
  final List<String>? rockets, launches;
  
  LaunchpadModel.fromJSON(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    fullName = json['full_name'],
    locality = json['locality'],
    region = json['region'],
    timezone = json['timezone'],
    latitude = json['latitude'],
    longitude = json['longitude'],
    launchAttempts = json['launch_attempts'],
    launchSuccesses = json['launch_successes'],
    rockets = List<String>.from(json['rockets']),
    launches = List<String>.from(json['launches']),
    status = LaunchpadStatusUtil.fromString(json['status']);
}