import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'rocket_carousel_state.dart';

class RocketCarouselCubit extends Cubit<RocketCarouselState> {
  RocketCarouselCubit({
    @required this.rocketsRepository,
  }) : super(RocketCarouselInitial());

  final RocketRepository rocketsRepository;

  Future<void> loadRockets() async {
    emit(RocketCarouselLoading());

    try {
      final rockets = await rocketsRepository.getAllRockets();

      if (rockets == null || rockets.isEmpty) {
        emit(RocketCarouselError());
        return;
      }

      emit(RocketCarouselLoaded(rockets));
    } catch (e) {
      print('RocketCarouselCubit.loadRockets ERROR: $e');
      emit(RocketCarouselError());
    }
  }
}
