part of 'launch.dart';

class LaunchCoreModel {
  LaunchCoreModel({
    this.core, 
    this.landingType, 
    this.landpad, 
    this.flight, 
    this.gridfins, 
    this.legs, 
    this.reused, 
    this.landingAttempt, 
    this.landingSuccess
  });

  final String core, landingType, landpad;
  final int flight;
  final bool gridfins, legs, reused, landingAttempt, landingSuccess;

  LaunchCoreModel.fromJSON(Map<String, dynamic> json) :
    core = json['core'],
    flight = json['flight'],
    gridfins = json['gridfins'],
    legs = json['legs'],
    reused = json['reused'],
    landingAttempt = json['landing_attempt'],
    landingSuccess = json['landing_success'],
    landingType = json['landing_type'],
    landpad = json['landpad'];

  static List<LaunchCoreModel> fromList(dynamic json) {
    List<LaunchCoreModel> cores = [];

    for (final core in json) {
      cores.add(LaunchCoreModel.fromJSON(core));
    }

    return cores;
  }

}