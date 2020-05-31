abstract class LaunchDetailsState {}
class LaunchDetailsStateInitial extends LaunchDetailsState {}
class LaunchDetailsStateLoading extends LaunchDetailsState {}

class LaunchDetailsStateLoaded extends LaunchDetailsState {
  LaunchDetailsStateLoaded(this.imageUrls);
  final List<String> imageUrls;
}

class LaunchDetailsStateError extends LaunchDetailsState {}