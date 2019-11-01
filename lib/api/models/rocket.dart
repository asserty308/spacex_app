class Rocket {
  Rocket({
    this.id,
    this.name,
    this.type,
  });

  String id, name, type;

  static Rocket fromJSON(Map<String, dynamic> json) {
    return Rocket(
      id: json['rocket_id'],
      name: json['rocket_name'],
      type: json['rocket_type'],
    );
  }
}