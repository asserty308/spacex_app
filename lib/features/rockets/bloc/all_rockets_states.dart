import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class AllRocketsState {}
class AllRocketsEmpty extends AllRocketsState {}
class AllRocketsLoading extends AllRocketsState {}

class AllRocketsLoaded extends AllRocketsState {
  AllRocketsLoaded(this.rockets);
  
  final List<Rocket> rockets;
}

class AllRocketsError extends AllRocketsState {}