import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationStateSplash());

  void showSplashScreen() => emit(AppNavigationStateSplash());
  void showLaunches() => emit(AppNavigationStateLaunches());
  void showRockets() => emit(AppNavigationStateRockets());
  void showHistory() => emit(AppNavigationStateHistory());
  void showLaunchpads() => emit(AppNavigationStateLaunchpads());
  void showAboutScreen() => emit(AppNavigationStateAbout());
}
