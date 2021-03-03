part of 'launch.dart';

class LaunchFairingsModel {
  LaunchFairingsModel({
    this.reused, 
    this.recoveryAttempt, 
    this.recovered, 
    this.ships,
  });

  final bool? reused, recoveryAttempt, recovered;

  /// List containing the IDs of the ships involved in the launch
  final List<dynamic>? ships;

  LaunchFairingsModel.fromJSON(Map<String, dynamic> json) :
    reused = json['reused'],
    recoveryAttempt = json['recovery_attempt'],
    recovered = json['recovered'],
    ships = json['ships'];
}
