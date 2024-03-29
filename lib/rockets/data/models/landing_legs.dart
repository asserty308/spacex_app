part of 'rocket.dart';

class RocketLandingLegs {
  RocketLandingLegs({
    this.number,
    this.material,
  });

  RocketLandingLegs.fromJSON(Map<String, dynamic> json) :
    number = json['number'],
    material = json['material'];

  final num? number;
  final String? material;
}