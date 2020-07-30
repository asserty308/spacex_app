import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:bloc/bloc.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'all_data_state.dart';

// TODO: Provide as local datasource
var globalLaunchData = <Launch>[];
var globalRocketData = <Rocket>[];
var globalHistoryData = <History>[];
var globalLaunchpadData = <Launchpad>[];

class AllDataCubit extends Cubit<AllDataState> {
  AllDataCubit() : super(AllDataEmpty());

  final _launchRepo = LaunchRepository();
  final _rocketRepo = RocketsRepository();
  final _historyRepo = HistoryRepository();
  final _launchpadRepo = LaunchpadRepository();

  void getAllData() async {
    emit(AllDataLoading());

    try {
      globalLaunchData = await _launchRepo.getAllLaunches();
      globalRocketData = await _rocketRepo.getAllRockets();
      globalHistoryData = await _historyRepo.getAllEvents();
      globalLaunchpadData = await _launchpadRepo.getAllLaunchpads();

      emit(AllDataStateLoaded());
    } catch (e) {
      print(e);
      emit(AllDataError());
    }
  }
}