import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class AllLaunchpadsState {}
class AllLaunchpadsEmpty extends AllLaunchpadsState {}
class AllLaunchpadsLoading extends AllLaunchpadsState {}

class AllLaunchpadsLoaded extends AllLaunchpadsState {
  AllLaunchpadsLoaded(this.launchpads);
  
  final List<Launchpad> launchpads;
}

class AllLaunchpadsError extends AllLaunchpadsState {}