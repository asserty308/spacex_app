import 'package:spacex_guide/features/launches/bloc/all_launches_events.dart';
import 'package:spacex_guide/features/launches/bloc/all_launches_states.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:bloc/bloc.dart';

var allLaunchesData = <Launch>[];

class AllLaunchesBloc extends Bloc<AllLaunchesEvent, AllLaunchesState> {
  final _repo = LaunchRepository();

  @override
  AllLaunchesState get initialState => AllLaunchesEmpty();

  @override
  Stream<AllLaunchesState> mapEventToState(AllLaunchesEvent event) async* {
    if (event is GetAllLaunches) {
      yield AllLaunchesLoading();

      try {
        if (allLaunchesData.isEmpty) {
          // only load once when the app starts because it is unlikely that 
          // data is updated on the api while the app is running
          allLaunchesData = await _repo.getAllLaunches();
        }
        yield AllLaunchesLoaded(/*allLaunchesData*/);
      } catch (_) {
        yield AllLaunchesError();
      }
    }
  }
}