import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_events.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_animation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _launchAnimation(context);
  }

  // Widgets

  Widget _launchAnimation(BuildContext context) => LaunchAnimation(
      onFinished: () {
        // loading data when animation ended makes the animation more performant
        BlocProvider.of<AppNavigationBloc>(context).add(ShowUpcomingLaunches());
      },
    );
}