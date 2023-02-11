import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'rocket_carousel_state.dart';

class RocketCarouselCubit extends Cubit<RocketCarouselState> {
  RocketCarouselCubit() : super(RocketCarouselInitial());

  final RocketRepository? rocketsRepository = GetIt.I<RocketRepository>();

  Future<void> loadRockets() async {
    emit(RocketCarouselLoading());

    try {
      final rockets = await rocketsRepository!.getAllRockets();

      if (rockets == null || rockets.isEmpty) {
        emit(RocketCarouselError());
        return;
      }

      emit(RocketCarouselLoaded(rockets));

      // This is an ugly solution to fix the issue that the initial page is not sized properly on the first load
      // TODO: Find a better way to fix the issue
      await Future.delayed(const Duration(milliseconds: 50));
      emit(RocketCarouselLoaded(rockets));
    } catch (e) {
      log('RocketCarouselCubit::loadRockets ERROR: $e');
      emit(RocketCarouselError());
    }
  }
}
