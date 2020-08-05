import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

part 'launch_list_state.dart';

class LaunchListBloc extends Cubit<LaunchListState> {
  LaunchListBloc({
    @required this.launchRepository,
  }) : super(LaunchListStateInitial());

  final LaunchRepository launchRepository;

  Future<void> loadUpcomingLaunches() async {
    emit(LaunchListStateLoading());
    final upcoming = await launchRepository.getUpcomingLaunches();
    emit(LaunchListStateUpcomingLoaded(upcoming));
  }

  Future<void> loadPreviousLaunches() async {
    emit(LaunchListStateLoading());
    final previous = await launchRepository.getPreviousLaunches();
    emit(LaunchListStatePreviousLoaded(previous));
  }
  
}