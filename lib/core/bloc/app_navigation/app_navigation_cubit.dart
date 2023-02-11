import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationStateLaunches());

  // void showSplashScreen() => emit(AppNavigationStateSplash());
  void showLaunches() => emit(AppNavigationStateLaunches());
  void showRockets() => emit(AppNavigationStateRockets());
  void showHistory() => emit(AppNavigationStateHistory());
  void showLaunchpads() => emit(AppNavigationStateLaunchpads());
  void showAboutScreen() => emit(AppNavigationStateAbout());

  Future<void> launchUrl(String? url, {Function()? onError}) async {
    if (url == null || url.isEmpty) {
      onError!();
      return;
    }
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(url);
    } else {
      log('AppNavigationCubit::launchURL ERROR on $url');
      onError!();
    }
  }
}
