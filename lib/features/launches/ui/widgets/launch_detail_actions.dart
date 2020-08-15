import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_action_button.dart';

class LaunchDetailActions extends StatelessWidget {
  const LaunchDetailActions({
    Key key,
    this.launch,
  }) : super(key: key);

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LaunchDetailActionButton(
          icon: Icon(Icons.ondemand_video), 
          onTap: () => playVideo(context),
        ),
        LaunchDetailActionButton(
          icon: Icon(Icons.insert_drive_file), 
          onTap: () => showPresskit(context),
        ),
      ],
    );
  }

  Future<void> showPresskit(BuildContext context) async {
    BlocProvider.of<AppNavigationCubit>(context).launchUrl(
      launch.links.presskit, 
      () => showOKDialog(context, 'Unavailable', 'There is no presskit availavle for this launch.')
    );
  }

  Future<void> playVideo(BuildContext context) async {
    BlocProvider.of<AppNavigationCubit>(context).launchUrl(
      launch.links.webcast, 
      () => showOKDialog(context, 'Unavailable', 'There is no video availavle for this launch.')
    );
  }
}