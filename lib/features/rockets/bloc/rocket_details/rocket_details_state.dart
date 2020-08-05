part of 'rocket_details_cubit.dart';

@immutable
abstract class RocketDetailsState {}

class RocketDetailsInitial extends RocketDetailsState {}
class RocketDetailsLoading extends RocketDetailsState {}

class RocketDetailsLoaded extends RocketDetailsState {
  RocketDetailsLoaded(this.launches);
  final List<LaunchModel> launches;
}

class RocketDetailsError extends RocketDetailsState {}
