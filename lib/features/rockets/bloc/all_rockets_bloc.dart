import 'package:bloc/bloc.dart';
import 'package:spacex_guide/features/rockets/bloc/all_rockets_events.dart';
import 'package:spacex_guide/features/rockets/bloc/all_rockets_states.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

class AllRocketsBloc extends Bloc<AllRocketsEvent, AllRocketsState> {
  final _repo = RocketsRepository();

  @override
  AllRocketsState get initialState => AllRocketsEmpty();

  @override
  Stream<AllRocketsState> mapEventToState(AllRocketsEvent event) async* {
    if (event is GetAllRockets) {
      yield AllRocketsLoading();

      try {
        final rockets = await _repo.getAllRockets();
        yield AllRocketsLoaded(rockets);
      } catch (_) {
        yield AllRocketsError();
      }
    }
  }
}