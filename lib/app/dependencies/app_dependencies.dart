import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/app/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/app/bloc/cubit/theme_selector_cubit.dart';
import 'package:spacex_guide/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/company_info/data/repositories/company_info_repository.dart';
import 'package:spacex_guide/history/bloc/all_events_list/all_events_list_cubit.dart';
import 'package:spacex_guide/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/launches/bloc/launch_details/launch_details_cubit.dart';
import 'package:spacex_guide/launches/bloc/launch_info/launch_info_cubit.dart';
import 'package:spacex_guide/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/launches/data/datasources/remote/launch_remote_datasource.dart';
import 'package:spacex_guide/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/launchpads/bloc/launchpad_list/launchpad_list_cubit.dart';
import 'package:spacex_guide/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/rockets/data/datasources/remote/rockets_remote_datasource.dart';
import 'package:spacex_guide/rockets/data/repositories/rockets_repository.dart';

class AppDependencies {
  static void register() {
    _registerDatasources();
    _registerRepositories();
    _registerBlocs();
  }

  static void _registerDatasources() {
    GetIt.I.registerLazySingleton(CompanyInfoApi.new);
    GetIt.I.registerLazySingleton(HistoryApi.new);
    GetIt.I.registerLazySingleton(LaunchApi.new);
    GetIt.I.registerLazySingleton(LaunchpadApi.new);
    GetIt.I.registerLazySingleton(RocketsApi.new);
  }

  static void _registerRepositories() {
    GetIt.I.registerLazySingleton(LaunchRepository.new);
    GetIt.I.registerLazySingleton(HistoryRepository.new);
    GetIt.I.registerLazySingleton(RocketRepository.new);
    GetIt.I.registerLazySingleton(LaunchpadRepository.new);
    GetIt.I.registerLazySingleton(CompanyInfoRepository.new);
  }

  static void _registerBlocs() {
    GetIt.I.registerLazySingleton(AppNavigationCubit.new);
    GetIt.I.registerLazySingleton(AllDataCubit.new);
    GetIt.I.registerLazySingleton(LaunchesNavigationCubit.new);
    GetIt.I.registerLazySingleton(LaunchListCubit.new);
    GetIt.I.registerLazySingleton(LaunchDetailsCubit.new);
    GetIt.I.registerLazySingleton(LaunchInfoCubit.new);
    GetIt.I.registerLazySingleton(CompanyInfoScreenCubit.new);
    GetIt.I.registerLazySingleton(AllEventsListCubit.new);
    GetIt.I.registerLazySingleton(AllLaunchpadsCubit.new);
    GetIt.I.registerLazySingleton(ThemeSelectorCubit.new);
  }
}