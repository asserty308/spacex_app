import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

part 'launches_navigation_state.dart';

class LaunchesNavigationCubit extends Cubit<LaunchesNavigationState> {
  LaunchesNavigationCubit() : super(LaunchesNavigationLaunchScreen());
  
  void showLaunchDetails(BuildContext context, LaunchModel launch) => emit(LaunchesNavigationStateDetails(context, launch));
}
