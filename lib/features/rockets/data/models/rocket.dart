class Rocket {
  Rocket({
    this.id,
    this.name,
    this.type,
    this.description,
    this.active,
    this.flickrImages,
  });

  String id, name, type, description;
  bool active;
  List<String> flickrImages;

  static Rocket fromJSON(Map<String, dynamic> json) {
    final flickrImages = json['flickr_images'] ?? [];

    return Rocket(
      id: json['rocket_id'],
      name: json['rocket_name'],
      type: json['rocket_type'],
      description: json['description'],
      active: json['active'],
      flickrImages: List<String>.from(flickrImages),
    );
  }
}