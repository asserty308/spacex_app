import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'launch_details_state.dart';

class LaunchDetailsCubit extends Cubit<LaunchDetailsState> {
  LaunchDetailsCubit({
    @required this.rocketRepository,
  }) : super(LaunchDetailsStateInitial());

  final RocketRepository rocketRepository;

  Future<void> loadLaunchDetails(LaunchModel launch) async {
    emit(LaunchDetailsStateLoading());

    var imageUrls = launch.links?.flickrOriginal ?? [];

    // When no launch images are available, get rocket images
    if (imageUrls.isEmpty) {
      final response = await rocketRepository.getRocket(launch.rocket);
      
      if (response is RocketModel) {
        imageUrls = response.flickrImages;
      }
    }

    emit(LaunchDetailsStateLoaded(imageUrls));
  }

}