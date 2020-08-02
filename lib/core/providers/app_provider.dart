import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/core/providers/repository_provider.dart';
import 'package:spacex_guide/core/ui/screens/app.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';

part 'bloc_provider.dart';

class AppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppRepositoryProvider(
    child: AppBlocProvider(
      child: MyApp(),
    ),
  );
}