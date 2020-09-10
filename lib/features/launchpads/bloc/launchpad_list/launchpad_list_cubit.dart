import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';

part 'launchpad_list_state.dart';

class AllLaunchpadsCubit extends Cubit<AllLaunchpadsState> {
  AllLaunchpadsCubit({
    @required this.launchpadRepository,
  }) : super(AllLaunchpadsInitial());

  final LaunchpadRepository launchpadRepository;

  Future<void> loadData() async {
    emit(AllLaunchpadsLoading());

    try {
      final launchpads = await launchpadRepository.getAllLaunchpads();
      emit(AllLaunchpadsLoaded(launchpads));

      if (launchpads == null || launchpads.isEmpty) {
        emit(AllLaunchpadsError());
        return;
      }

      emit(AllLaunchpadsLoaded(launchpads));
    } catch (e) {
      print('LaunchpadListCubit::loadData ERROR: $e');
      emit(AllLaunchpadsError());
    }
  }
}
