import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/core/bloc/cubit/theme_selector_cubit.dart';
import 'package:spacex_guide/core/ui/styles/default_theme.dart';
import 'package:spacex_guide/features/company_info/ui/screens/company_info_screen.dart';
import 'package:spacex_guide/features/history/ui/screens/all_events_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/launches_master_screen.dart';
import 'package:spacex_guide/features/launchpads/ui/screens/all_launchpads_screen.dart';
import 'package:spacex_guide/features/rockets/ui/screens/all_rockets_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    GetIt.I<AllDataCubit>().getAllData();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder(
    bloc: GetIt.I<ThemeSelectorCubit>(),
    builder: (context, dynamic state) {
      if (state is ThemeSelectorDark) {
        return themedApp(darkTheme);
      }

      return themedApp(lightTheme);
    }
  );

  Widget themedApp(ThemeData theme) => MaterialApp(
    title: 'SpaceX',
    debugShowCheckedModeBanner: false,
    theme: theme,
    home: _navigationBuilder,
  );

  // Widgets

  Widget get _navigationBuilder => BlocBuilder<AppNavigationCubit, AppNavigationState>(
    bloc: GetIt.I<AppNavigationCubit>(),
    builder: (context, state) {
      // if (state is AppNavigationStateSplash) {
      //   return SplashScreen();
      // }

      if (state is AppNavigationStateLaunches) {
        return LaunchesMasterScreen();
      }

      if (state is AppNavigationStateHistory) {
        return AllEventsScreen();
      }

      if (state is AppNavigationStateRockets) {
        return AllRocketsScreen();
      }

      if (state is AppNavigationStateLaunchpads) {
        return AllLaunchpadsScreen();
      }

      if (state is AppNavigationStateAbout) {
        return CompanyInfoScreen();
      }

      return Container();
    },
  );
}