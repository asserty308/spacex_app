import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';

part 'all_events_list_state.dart';

class AllEventsListCubit extends Cubit<AllEventsListState> {
  AllEventsListCubit() : super(AllEventsListInitial());

  final HistoryRepository? repository = GetIt.I<HistoryRepository>();

  Future<void> getAllEvents() async {
    emit(AllEventsListLoading());

    try {
      final events = await repository!.getAllEvents();
    
      if (events == null || events.isEmpty) {
        emit(AllEventsListError());
        return;
      }

      emit(AllEventsListLoaded(events));
    } catch (e) {
      print('AllEventsListCubit::getAllEvents ERROR: $e');
      emit(AllEventsListError());
    }
  }
}
