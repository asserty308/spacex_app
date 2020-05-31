import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_events.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_states.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

class LaunchDetailsBloc extends Bloc<LaunchDetailsEvent, LaunchDetailsState> {
  final _repo = RocketsRepository();

  @override
  LaunchDetailsState get initialState => LaunchDetailsStateInitial();

  @override
  Stream<LaunchDetailsState> mapEventToState(LaunchDetailsEvent event) async* {
    if (event is LoadLaunchDetails) {
      yield* _mapLoadLaunchDetailsToState(event);
    }
  }

  Stream<LaunchDetailsState> _mapLoadLaunchDetailsToState(LoadLaunchDetails event) async* {
    yield LaunchDetailsStateLoading();

    var imageUrls = event.launch?.flickrImages ?? [];

    if (imageUrls.isEmpty) {
      final response = await _repo.getRocket(event.launch.rocket.id);
      
      if (response is Rocket) {
        imageUrls = response.flickrImages;
      }
    }

    yield LaunchDetailsStateLoaded(imageUrls);
  }

}