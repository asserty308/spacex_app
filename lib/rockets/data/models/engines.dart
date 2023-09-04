part of 'rocket.dart';

class RocketEngines {
  RocketEngines({
    this.number, 
    this.type, 
    this.version, 
    this.layout, 
    this.ispSeaLevel, 
    this.ispVacuum, 
    this.engineLossMax, 
    this.propellant1, 
    this.propellant2, 
    this.thrustSeaLevelKn, 
    this.thrustVacuumKn, 
    this.thrustToWeight
  });

  RocketEngines.fromJSON(Map<String, dynamic> json) :
    number = json['number'],
    type = json['type'],
    version = json['version'],
    layout = json['layout'],
    ispSeaLevel = json['isp']['sea_level'],
    ispVacuum = json['isp']['vacuum'],
    engineLossMax = json['engine_loss_max'],
    propellant1 = json['propellant_1'],
    propellant2 = json['propellant_2'],
    thrustSeaLevelKn = json['thrust_sea_level']['kN'],
    thrustVacuumKn = json['thrust_vacuum']['kN'],
    thrustToWeight = json['thrust_to_weight'];

  final int? number;
  final String? type, version, layout;
  final num? ispSeaLevel, ispVacuum;
  final num? engineLossMax;
  final String? propellant1, propellant2;
  final num? thrustSeaLevelKn, thrustVacuumKn, thrustToWeight;
}