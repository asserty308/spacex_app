import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationStateSplash());

  void showSplashScreen() => emit(AppNavigationStateSplash());
  void showLaunches() => emit(AppNavigationStateLaunches());
  void showRockets() => emit(AppNavigationStateRockets());
  void showHistory() => emit(AppNavigationStateHistory());
  void showLaunchpads() => emit(AppNavigationStateLaunchpads());
  void showAboutScreen() => emit(AppNavigationStateAbout());

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print('AppNavigationCubit::launchURL ERROR on $url');
    }
  }
}
