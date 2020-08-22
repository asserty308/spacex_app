import 'package:flutter_core/services/alerts.dart';
import 'package:flutter_web/services/connectivity_service.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/features/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/features/launches/data/datasources/remote/launch_remote_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/features/rockets/data/datasources/remote/rockets_remote_datasource.dart';

class AppSingletons {
  static void register() {
    // Services
    GetIt.I.registerLazySingleton(() => ConnectivityService());
    GetIt.I.registerLazySingleton(() => AlertService());

    // Datasources
    GetIt.I.registerLazySingleton(() => CompanyInfoApi());
    GetIt.I.registerLazySingleton(() => HistoryApi());
    GetIt.I.registerLazySingleton(() => LaunchApi());
    GetIt.I.registerLazySingleton(() => LaunchpadApi());
    GetIt.I.registerLazySingleton(() => RocketsApi());
  }
}