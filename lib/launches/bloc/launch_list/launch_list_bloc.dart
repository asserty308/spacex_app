import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launches/data/repositories/launch_repository.dart';

part 'launch_list_state.dart';

class LaunchListCubit extends Cubit<LaunchListState> {
  LaunchListCubit() : super(LaunchListStateInitial());

  final LaunchRepository launchRepository = GetIt.I<LaunchRepository>();

  Future<void> loadUpcomingLaunches() async {
    emit(LaunchListStateLoading());
    final upcoming = await launchRepository.getUpcomingLaunches();
    final scheduled = upcoming?.where((element) => element.isScheduled).toList();
    final nonScheduled = upcoming?.where((element) => !element.isScheduled).toList();
    emit(LaunchListStateUpcomingLoaded(scheduled: scheduled, nonScheduled: nonScheduled));
  }

  Future<void> loadPreviousLaunches() async {
    emit(LaunchListStateLoading());
    final previous = await launchRepository.getPreviousLaunches();
    emit(LaunchListStatePreviousLoaded(previous));
  }
  
}