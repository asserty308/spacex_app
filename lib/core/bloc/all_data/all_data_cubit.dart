import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'all_data_state.dart';

class AllDataCubit extends Cubit<AllDataState> {
  AllDataCubit({
    @required this.launchRepository,
    @required this.rocketRepository,
    @required this.historyRepository,
    @required this.launchpadRepository,
  }) : super(AllDataEmpty());

  final LaunchRepository launchRepository;
  final RocketRepository rocketRepository;
  final HistoryRepository historyRepository;
  final LaunchpadRepository launchpadRepository;

  void getAllData() async {
    emit(AllDataLoading());

    try {
      await launchRepository.getAllLaunches();
      await rocketRepository.getAllRockets();
      await historyRepository.getAllEvents();
      await launchpadRepository.getAllLaunchpads();
      emit(AllDataStateLoaded());
    } catch (e) {
      print(e);
      emit(AllDataError());
    }
  }
}