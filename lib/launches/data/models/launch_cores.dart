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

  final String? core, landingType, landpad;
  final int? flight;
  final bool? gridfins, legs, reused, landingAttempt, landingSuccess;

  static List<LaunchCoreModel> fromList(dynamic json) {
    var cores = <LaunchCoreModel>[];

    for (final core in json) {
      cores.add(LaunchCoreModel.fromJSON(core));
    }

    return cores;
  }

}