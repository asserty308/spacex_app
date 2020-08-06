part of 'launchpad_list_cubit.dart';

@immutable
abstract class LaunchpadListState {}

class LaunchpadListInitial extends LaunchpadListState {}
class LaunchpadListLoading extends LaunchpadListState {}

class LaunchpadListLoaded extends LaunchpadListState {
  LaunchpadListLoaded(this.allLaunchpads);
  final List<LaunchpadModel> allLaunchpads;
}

class LaunchpadListError extends LaunchpadListState {}
