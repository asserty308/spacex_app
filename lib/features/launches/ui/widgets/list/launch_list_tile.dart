import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_avatar.dart';

class LaunchListTile extends StatelessWidget {
  const LaunchListTile({
    Key key,
    @required this.launch,
  }) : super(key: key);

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) => ListTile(
    title: _title,
    subtitle: _subtitle,
    leading: LaunchListAvatar(launch: launch,),
    trailing: _trailing,
    onTap: () => _onTap(context),
  );

  // Widgets

  Widget get _title => Text(
    launch.name,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget get _subtitle => Text(
    launch.formattedLaunchDate(),
    style: const TextStyle(
      color: Colors.white,
    ),
  );

  Widget get _trailing => Icon(
    Icons.arrow_forward_ios,
    color: Colors.white30,
    size: 18,
  );

  // Functions

  void _onTap(BuildContext context) => GetIt.I<LaunchesNavigationCubit>().showLaunchDetails(context, launch);
}