import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

abstract class LaunchesNavigationState {}
class LaunchesNavigationStateUpcoming extends LaunchesNavigationState {}
class LaunchesNavigationStatePrevious extends LaunchesNavigationState {}

class LaunchesNavigationStateDetails extends LaunchesNavigationState {
  LaunchesNavigationStateDetails(this.navContext, this.launch);
  final BuildContext navContext;
  final Launch launch;
}