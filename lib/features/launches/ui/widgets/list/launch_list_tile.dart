import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
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
      onTap: () => showScreen(context, LaunchDetailScreen(launch)),
    );
  }
}