import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/app/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/app/bloc/cubit/theme_selector_cubit.dart';
import 'package:spacex_guide/app/ui/styles/default_theme.dart';
import 'package:spacex_guide/company_info/ui/screens/company_info_screen.dart';
import 'package:spacex_guide/history/ui/screens/all_events_screen.dart';
import 'package:spacex_guide/launches/ui/screens/launches_master_screen.dart';
import 'package:spacex_guide/launchpads/ui/screens/all_launchpads_screen.dart';
import 'package:spacex_guide/rockets/ui/screens/all_rockets_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
        return const LaunchesMasterScreen();
      }

      if (state is AppNavigationStateHistory) {
        return const AllEventsScreen();
      }

      if (state is AppNavigationStateRockets) {
        return const AllRocketsScreen();
      }

      if (state is AppNavigationStateLaunchpads) {
        return const AllLaunchpadsScreen();
      }

      if (state is AppNavigationStateAbout) {
        return const CompanyInfoScreen();
      }

      return Container();
    },
  );
}