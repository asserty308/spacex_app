part of 'rocket.dart';

class RocketFirstStage {
  RocketFirstStage({
    this.reusable, 
    this.engines, 
    this.fuelAmountTons, 
    this.burnTimeSeconds, 
    this.thrustSeaLevelKn, 
    this.thrustVacuumKm
  });

  final bool? reusable;
  final int? engines;
  final num? fuelAmountTons, burnTimeSeconds, thrustSeaLevelKn, thrustVacuumKm;

  RocketFirstStage.fromJSON(Map<String, dynamic> json) :
    reusable = json['reusable'],
    engines = json['engines'],
    fuelAmountTons = json['fuel_amount_tons'],
    burnTimeSeconds = json['burn_time_sec'],
    thrustSeaLevelKn = json['thrust_sea_level']['kN'],
    thrustVacuumKm = json['thrust_vacuum']['kN'];
}