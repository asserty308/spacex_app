part of 'rocket.dart';

class RocketSecondStage {
  RocketSecondStage({
    this.reusable, 
    this.engines, 
    this.fuelAmountTons, 
    this.burnTimeSeconds, 
    this.thrustKn,
  });

  RocketSecondStage.fromJSON(Map<String, dynamic> json) :
    reusable = json['reusable'],
    engines = json['engines'],
    fuelAmountTons = json['fuel_amount_tons'],
    burnTimeSeconds = json['burn_time_sec'],
    thrustKn = json['thrust']['kN'];

  final bool? reusable;
  final int? engines;
  final num? fuelAmountTons, burnTimeSeconds, thrustKn;
}