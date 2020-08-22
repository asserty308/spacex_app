import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/core/ui/screens/app.dart';
import 'package:spacex_guide/features/company_info/data/repositories/company_info_repository.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'bloc_provider.dart';
part 'repository_provider.dart';

class AppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppRepositoryProvider(
    child: AppBlocProvider(
      child: MyApp(),
    ),
  );
}