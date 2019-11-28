import 'package:spacex_guide/features/history/data/models/history.dart';

class AllEventsState {}
class AllEventsEmpty extends AllEventsState {}
class AllEventsLoading extends AllEventsState {}

class AllEventsLoaded extends AllEventsState {
  AllEventsLoaded(this.events);
  
  final List<History> events;
}

class AllEventsError extends AllEventsState {}