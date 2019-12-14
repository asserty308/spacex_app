class Launchpad {
  Launchpad({
    this.id,
    this.attemptedLaunches,
    this.successfulLaunches,
    this.name,
    this.status,
    this.details,
    this.locationName,
    this.locationRegion,
    this.latitude,
    this.longitude
  });

  int id, attemptedLaunches, successfulLaunches;
  String name, status, details;
  String locationName, locationRegion;
  double latitude, longitude;

  static Launchpad fromJSON(Map<String, dynamic> json) {
    return Launchpad(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      locationName: json['location']['name'],
      locationRegion: json['location']['region'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
      attemptedLaunches: json['attempted_launches'],
      successfulLaunches: json['successful_launches'],
      details: json['details'],
    );
  }
}