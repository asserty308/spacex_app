import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/features/splash/ui/widgets/launch_animation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LaunchAnimation(
    onFinished: () => GetIt.I<AppNavigationCubit>().showLaunches(),
  );
}