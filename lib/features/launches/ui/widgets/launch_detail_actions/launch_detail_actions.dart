import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

part 'launch_detail_action_button.dart';

class LaunchDetailActions extends StatelessWidget {
  const LaunchDetailActions({
    Key? key,
    required this.launch,
  }) : super(key: key);

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      LaunchDetailActionButton(
        icon: const Icon(Icons.ondemand_video), 
        onTap: () => playVideo(context),
      ),
      LaunchDetailActionButton(
        icon: const Icon(Icons.insert_drive_file), 
        onTap: () => showPresskit(context),
      ),
    ],
  );

  Future<void> showPresskit(BuildContext context) async {
    await GetIt.I<AppNavigationCubit>().launchUrl(
      launch.links!.presskit, 
      onError: () => null, // GetIt.I.get<AlertService>().showDismissDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.')
    );
  }

  Future<void> playVideo(BuildContext context) async {
    await GetIt.I<AppNavigationCubit>().launchUrl(
      launch.links!.webcast, 
      onError: () => null, // GetIt.I.get<AlertService>().showDismissDialog(context, 'Unavailable', 'There is no video availavle for this launch.')
    );
  }
}