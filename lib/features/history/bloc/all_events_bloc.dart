import 'package:spacex_guide/features/history/bloc/all_events_events.dart';
import 'package:spacex_guide/features/history/bloc/all_events_states.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:bloc/bloc.dart';

class AllEventsBloc extends Bloc<AllEventsEvent, AllEventsState> {
  final _repo = HistoryRepository();

  @override
  AllEventsState get initialState => AllEventsEmpty();

  @override
  Stream<AllEventsState> mapEventToState(AllEventsEvent event) async* {
    if (event is GetAllEvents) {
      yield AllEventsLoading();

      try {
        final events = await _repo.getAllEvents();
        yield AllEventsLoaded(events);
      } catch (_) {
        yield AllEventsError();
      }
    }
  }
}