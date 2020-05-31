import 'package:spacex_guide/core/bloc/all_data/all_data_events.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_states.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:bloc/bloc.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

// TODO: Provide as local datasource
var globalLaunchData = <Launch>[];
var globalRocketData = <Rocket>[];
var globalHistoryData = <History>[];
var globalLaunchpadData = <Launchpad>[];

class AllDataBloc extends Bloc<AllDataEvent, AllDataState> {
  final _launchRepo = LaunchRepository();
  final _rocketRepo = RocketsRepository();
  final _historyRepo = HistoryRepository();
  final _launchpadRepo = LaunchpadRepository();

  @override
  AllDataState get initialState => AllDataEmpty();

  @override
  Stream<AllDataState> mapEventToState(AllDataEvent event) async* {
    if (event is GetAllData) {
      yield* _mapGetAllDataToState(event);
    }
  }

  Stream<AllDataState> _mapGetAllDataToState(GetAllData event) async* {
    yield AllDataLoading();

    try {
      globalLaunchData = await _launchRepo.getAllLaunches();
      globalRocketData = await _rocketRepo.getAllRockets();
      globalHistoryData = await _historyRepo.getAllEvents();
      globalLaunchpadData = await _launchpadRepo.getAllLaunchpads();

      yield AllDataStateLoaded();
    } catch (e) {
      print(e);
      yield AllDataError();
    }
  }
}