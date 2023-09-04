part of 'launchpad_list_cubit.dart';

@immutable
abstract class AllLaunchpadsState {}

class AllLaunchpadsInitial extends AllLaunchpadsState {}
class AllLaunchpadsLoading extends AllLaunchpadsState {}

class AllLaunchpadsLoaded extends AllLaunchpadsState {
  AllLaunchpadsLoaded(this.allLaunchpads);
  final List<LaunchpadModel>? allLaunchpads;
}

class AllLaunchpadsError extends AllLaunchpadsState {}
