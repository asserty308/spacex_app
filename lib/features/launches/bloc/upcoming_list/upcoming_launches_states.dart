import 'package:spacex_guide/features/launches/data/models/launch.dart';

abstract class UpcomingLaunchesState {}
class UpcomingLaunchesStateInitial extends UpcomingLaunchesState {}
class UpcomingLaunchesStateLoading extends UpcomingLaunchesState {}

class UpcomingLaunchesStateLoaded extends UpcomingLaunchesState {
  UpcomingLaunchesStateLoaded(this.launches);
  final List<Launch> launches;
}

class UpcomingLaunchesStateError extends UpcomingLaunchesState {}