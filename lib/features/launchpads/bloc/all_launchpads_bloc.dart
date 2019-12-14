import 'package:spacex_guide/features/launchpads/bloc/all_launchpads_events.dart';
import 'package:spacex_guide/features/launchpads/bloc/all_launchpads_states.dart';
import 'package:bloc/bloc.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';

class AllLaunchpadsBloc extends Bloc<AllLaunchpadsEvent, AllLaunchpadsState> {
  final _repo = LaunchpadRepository();

  @override
  AllLaunchpadsState get initialState => AllLaunchpadsEmpty();

  @override
  Stream<AllLaunchpadsState> mapEventToState(AllLaunchpadsEvent event) async* {
    if (event is GetAllLaunchpads) {
      yield AllLaunchpadsLoading();

      try {
        final launchpads = await _repo.getAllLaunches();
        yield AllLaunchpadsLoaded(launchpads);
      } catch (_) {
        yield AllLaunchpadsError();
      }
    }
  }
}