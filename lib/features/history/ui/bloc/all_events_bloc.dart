import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:bloc/bloc.dart';

enum AllEventsState {
  empty,
  loading,
  loaded,
  error
}

enum AllEventsEvent {
  getAllEvents,
}

class AllEventsBloc extends Bloc<AllEventsEvent, AllEventsState> {
  final _repo = HistoryRepository();
  final _historyFetcher = PublishSubject<List<History>>();

  Observable<List<History>> get stream => _historyFetcher.stream;

  @override
  AllEventsState get initialState => AllEventsState.empty;

  @override
  Stream<AllEventsState> mapEventToState(AllEventsEvent event) async* {
    switch (event) {
      case AllEventsEvent.getAllEvents:
        yield* _getAllEvents();
        break;
    }
  }

  @override
  Future<void> close() async {
    _historyFetcher.close();
    super.close();
  }

  Stream<AllEventsState> _getAllEvents() async* {
    yield AllEventsState.loading;

    final events = await _repo.getAllEvents();

    if (events is AppError) {
      yield AllEventsState.error;
      return;
    }

    _historyFetcher.sink.add(events);
    yield AllEventsState.loaded;
  }
}