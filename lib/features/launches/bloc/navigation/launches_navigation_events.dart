import 'package:spacex_guide/features/launches/data/models/launch.dart';

abstract class LaunchesNavigationEvent {}
class ShowUpcomingLaunches extends LaunchesNavigationEvent {}
class ShowPreviousLaunches extends LaunchesNavigationEvent {}

class ShowLaunchDetails extends LaunchesNavigationEvent {
  ShowLaunchDetails(this.launch);
  final Launch launch;  
}