import 'package:spacex_guide/features/launches/data/models/launch.dart';

abstract class LaunchDetailsEvent {}

class LoadLaunchDetails extends LaunchDetailsEvent {
  LoadLaunchDetails(this.launch);
  final LaunchModel launch;
}