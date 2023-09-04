part of 'launches_navigation_bloc.dart';

abstract class LaunchesNavigationState {}
class LaunchesNavigationLaunchScreen extends LaunchesNavigationState {}

class LaunchesNavigationStateDetails extends LaunchesNavigationState {
  LaunchesNavigationStateDetails(this.navContext, this.launch);
  final BuildContext navContext;
  final LaunchModel launch;
}