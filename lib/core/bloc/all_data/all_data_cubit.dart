import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'all_data_state.dart';

class AllDataCubit extends Cubit<AllDataState> {
  AllDataCubit() : super(AllDataEmpty());

  final LaunchRepository launchRepository = GetIt.I<LaunchRepository>();
  final RocketRepository rocketRepository = GetIt.I<RocketRepository>();
  final HistoryRepository historyRepository = GetIt.I<HistoryRepository>();
  final LaunchpadRepository launchpadRepository = GetIt.I<LaunchpadRepository>();

  void getAllData() async {
    emit(AllDataLoading());

    try {
      await launchRepository.getAllLaunches();
      await rocketRepository.getAllRockets();
      //await historyRepository.getAllEvents();
      await launchpadRepository.getAllLaunchpads();
      emit(AllDataStateLoaded());
    } catch (e) {
      print('AllDataCubit::getAllData ERROR: $e');
      emit(AllDataError());
    }
  }
}