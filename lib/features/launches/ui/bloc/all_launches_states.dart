import 'package:spacex_guide/features/launches/data/models/launch.dart';

class AllLaunchesState {}
class AllLaunchesEmpty extends AllLaunchesState {}
class AllLaunchesLoading extends AllLaunchesState {}

class AllLaunchesLoaded extends AllLaunchesState {
  AllLaunchesLoaded(this.launches);
  
  final List<Launch> launches;
}

class AllLaunchesError extends AllLaunchesState {}