part of 'all_events_list_cubit.dart';

@immutable
abstract class AllEventsListState {}

class AllEventsListInitial extends AllEventsListState {}
class AllEventsListLoading extends AllEventsListState {}

class AllEventsListLoaded extends AllEventsListState {
  AllEventsListLoaded(this.allEvents);
  final List<History> allEvents;
}

class AllEventsListError extends AllEventsListState {}
