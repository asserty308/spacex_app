import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/rockets/data/models/rocket.dart';
import 'package:spacex_guide/rockets/data/repositories/rockets_repository.dart';

part 'launch_info_state.dart';

class LaunchInfoCubit extends Cubit<LaunchInfoState> {
  LaunchInfoCubit() : super(LaunchInfoInitial());

  final RocketRepository? rocketRepository = GetIt.I<RocketRepository>();
  final LaunchpadRepository? launchpadRepository = GetIt.I<LaunchpadRepository>();
  
  Future<void> loadData(LaunchModel launch) async {
    emit(LaunchInfoLoading());

    try {
      final rocket = await rocketRepository!.getRocket(launch.rocket);
      final launchpad = await launchpadRepository!.getLaunchpad(launch.launchpad);
      emit(LaunchInfoLoaded(rocket: rocket, launchpad: launchpad));
    } catch (e) {
      log('LaunchInfoCubit::loadData ERROR: $e');
      emit(LaunchInfoError());
    }
  }
}
