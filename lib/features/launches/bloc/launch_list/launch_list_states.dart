import 'package:spacex_guide/features/launches/data/models/launch.dart';

abstract class LaunchListState {}
class LaunchListStateInitial extends LaunchListState {}
class LaunchListStateLoading extends LaunchListState {}

class LaunchListStateUpcomingLoaded extends LaunchListState {
  LaunchListStateUpcomingLoaded(this.launches);
  final List<Launch> launches;
}

class LaunchListStatePreviousLoaded extends LaunchListState {
  LaunchListStatePreviousLoaded(this.launches);
  final List<Launch> launches;
}

class LaunchListStateError extends LaunchListState {}