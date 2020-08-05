part of 'rocket_carousel_cubit.dart';

@immutable
abstract class RocketCarouselState {}

class RocketCarouselInitial extends RocketCarouselState {}
class RocketCarouselLoading extends RocketCarouselState {}

class RocketCarouselLoaded extends RocketCarouselState {
  RocketCarouselLoaded(this.allRockets);
  final List<RocketModel> allRockets;
}

class RocketCarouselError extends RocketCarouselState {}
