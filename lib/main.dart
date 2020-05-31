import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:spacex_guide/core/ui/screens/app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppNavigationBloc>(
          create: (context) => AppNavigationBloc(),
        ),
        BlocProvider<AllDataBloc>(
          create: (context) => AllDataBloc(),
        ),
      ], 
      child: MyApp()
    )
  );
}

