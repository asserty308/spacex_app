part of 'launch_info_cubit.dart';

@immutable
abstract class LaunchInfoState {}

class LaunchInfoInitial extends LaunchInfoState {}
class LaunchInfoLoading extends LaunchInfoState {}

class LaunchInfoLoaded extends LaunchInfoState {
  LaunchInfoLoaded({
    this.rocket, 
    this.launchpad,
  });

  final RocketModel rocket;
  final Launchpad launchpad;
}

class LaunchInfoError extends LaunchInfoState {}
