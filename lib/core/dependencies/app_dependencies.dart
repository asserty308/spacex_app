import 'package:flutter_core/services/alerts.dart';
import 'package:flutter_web/services/connectivity_service.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/core/bloc/cubit/theme_selector_cubit.dart';
import 'package:spacex_guide/features/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/features/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/features/company_info/data/repositories/company_info_repository.dart';
import 'package:spacex_guide/features/history/bloc/all_events_list/all_events_list_cubit.dart';
import 'package:spacex_guide/features/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_cubit.dart';
import 'package:spacex_guide/features/launches/bloc/launch_info/launch_info_cubit.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/datasources/remote/launch_remote_datasource.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/bloc/launchpad_list/launchpad_list_cubit.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/datasources/remote/rockets_remote_datasource.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

class AppDependencies {
  static void register() {
    _registerServices();
    _registerDatasources();
    _registerRepositories();
    _registerBlocs();
  }

  static void _registerServices() {
    GetIt.I.registerLazySingleton(() => ConnectivityService());
    GetIt.I.registerLazySingleton(() => AlertService());
  }

  static void _registerDatasources() {
    GetIt.I.registerLazySingleton(() => CompanyInfoApi());
    GetIt.I.registerLazySingleton(() => HistoryApi());
    GetIt.I.registerLazySingleton(() => LaunchApi());
    GetIt.I.registerLazySingleton(() => LaunchpadApi());
    GetIt.I.registerLazySingleton(() => RocketsApi());
  }

  static void _registerRepositories() {
    GetIt.I.registerLazySingleton(() => LaunchRepository());
    GetIt.I.registerLazySingleton(() => HistoryRepository());
    GetIt.I.registerLazySingleton(() => RocketRepository());
    GetIt.I.registerLazySingleton(() => LaunchpadRepository());
    GetIt.I.registerLazySingleton(() => CompanyInfoRepository());
  }

  static void _registerBlocs() {
    GetIt.I.registerLazySingleton(() => AppNavigationCubit());
    GetIt.I.registerLazySingleton(() => AllDataCubit());
    GetIt.I.registerLazySingleton(() => LaunchesNavigationCubit());
    GetIt.I.registerLazySingleton(() => LaunchListCubit());
    GetIt.I.registerLazySingleton(() => LaunchDetailsCubit());
    GetIt.I.registerLazySingleton(() => LaunchInfoCubit());
    GetIt.I.registerLazySingleton(() => CompanyInfoScreenCubit());
    GetIt.I.registerLazySingleton(() => AllEventsListCubit());
    GetIt.I.registerLazySingleton(() => AllLaunchpadsCubit());
    GetIt.I.registerLazySingleton(() => ThemeSelectorCubit());
  }
}