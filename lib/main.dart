import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/core/ui/screens/app.dart';

import 'features/launches/bloc/navigation/launches_navigation_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppNavigationCubit>(
          create: (context) => AppNavigationCubit(),
        ),
        BlocProvider<AllDataCubit>(
          create: (context) => AllDataCubit(),
        ),
        BlocProvider<LaunchesNavigationBloc>(
          create: (context) => LaunchesNavigationBloc(),
        ),
      ], 
      child: MyApp()
    ),
  );
}
