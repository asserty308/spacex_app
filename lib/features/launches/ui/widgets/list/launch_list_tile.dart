import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_events.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_avatar.dart';

class LaunchListTile extends StatelessWidget {
  const LaunchListTile({
    Key key,
    @required this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        launch.missionName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        launch.formattedLaunchDate(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: LaunchListAvatar(launch: launch,),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white30,
        size: 18,
      ),
      onTap: () { 
        BlocProvider.of<LaunchesNavigationBloc>(context).add(ShowLaunchDetails(context, launch));
        //showScreen(context, LaunchDetailScreen(launch));
      }
    );
  }
}