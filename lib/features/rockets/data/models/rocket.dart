class Rocket {
  Rocket({
    this.id,
    this.name,
    this.type,
    this.description,
    this.active,
    this.flickrImages,
    this.costPerLaunch,
    this.successRate,
    this.firstFlight,
  });

  String id, name, type, description;
  bool active;
  List<String> flickrImages;
  int costPerLaunch, successRate;
  DateTime firstFlight;

  static Rocket fromJSON(Map<String, dynamic> json) {
    final flickrImages = json['flickr_images'] ?? [];

    DateTime date;
    try {
      date = DateTime.parse(json['first_flight'] ?? '');
    } catch (_) {
      date = null;
    }

    return Rocket(
      id: json['rocket_id'] ?? '',
      name: json['rocket_name'] ?? '',
      type: json['rocket_type'] ?? '',
      description: json['description'] ?? '',
      active: json['active'] ?? false,
      costPerLaunch: json['cost_per_launch'] ?? 0,
      successRate: json['success_rate_pct'] ?? 0,
      firstFlight: date,
      flickrImages: List<String>.from(flickrImages),
    );
  }
}