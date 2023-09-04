import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/rockets/data/repositories/rockets_repository.dart';

part 'launch_details_state.dart';

class LaunchDetailsCubit extends Cubit<LaunchDetailsState> {
  LaunchDetailsCubit() : super(LaunchDetailsStateInitial());

  final rocketRepository = GetIt.I<RocketRepository>();

  Future<void> loadLaunchDetails(LaunchModel launch) async {
    emit(LaunchDetailsStateLoading());

    var imageUrls = launch.links?.flickrOriginal ?? [];

    // When no launch images are available, get rocket images
    if (imageUrls.isEmpty) {
      final response = await rocketRepository.getRocket(launch.rocket);
      imageUrls = response.flickrImages!;
    }

    emit(LaunchDetailsStateLoaded(imageUrls));
  }

}