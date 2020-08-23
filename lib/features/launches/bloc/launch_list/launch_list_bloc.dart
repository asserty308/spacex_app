import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

part 'launch_list_state.dart';

class LaunchListCubit extends Cubit<LaunchListState> {
  LaunchListCubit({
    @required this.launchRepository,
  }) : super(LaunchListStateInitial());

  final LaunchRepository launchRepository;

  Future<void> loadUpcomingLaunches() async {
    emit(LaunchListStateLoading());
    final upcoming = await launchRepository.getUpcomingLaunches();
    final scheduled = upcoming.where((element) => element.datePrecision == DatePrecision.hour).toList();
    final nonScheduled = upcoming.where((element) => element.datePrecision != DatePrecision.hour).toList();
    emit(LaunchListStateUpcomingLoaded(scheduled: scheduled, nonScheduled: nonScheduled));
  }

  Future<void> loadPreviousLaunches() async {
    emit(LaunchListStateLoading());
    final previous = await launchRepository.getPreviousLaunches();
    emit(LaunchListStatePreviousLoaded(previous));
  }
  
}