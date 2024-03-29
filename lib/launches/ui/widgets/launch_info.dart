import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/launches/bloc/launch_info/launch_info_cubit.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launches/ui/widgets/launch_detail_actions/launch_detail_actions.dart';
import 'package:spacex_guide/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/rockets/data/models/rocket.dart';

import 'package:spacex_guide/launches/ui/widgets/launch_countdown/launch_countdown_card.dart';

class LaunchInfo extends StatelessWidget {
  const LaunchInfo({
    super.key,
    required this.launch,
  });

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) => BlocBuilder<LaunchInfoCubit, LaunchInfoState>(
    bloc: GetIt.I<LaunchInfoCubit>()..loadData(launch),
    builder: (context, state) {
      if (state is LaunchInfoLoaded) {
        return _listView(state.rocket!, state.launchpad!);
      }

      return Container();
    },
  );
  
  Widget _listView(RocketModel rocket, LaunchpadModel launchpad) => ListView(
    padding: const EdgeInsets.only(top: 24),
    children: <Widget>[
      !launch.upcoming! ? LaunchDetailActions(launch: launch,) : LaunchCountdownCard(launch: launch, showLaunchOnTap: false,),
      const SizedBox(height: 8,),
      ListTile(
        title: const Text(
          'Launch Site',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          launchpad.name ?? 'Unknown',
          style: const TextStyle(
            color: Colors.white,
            height: 1.2,
            fontSize: 16,
          ),
        ),
      ),
      ListTile(
        title: const Text(
          'Rocket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          rocket.name!,
          style: const TextStyle(
            color: Colors.white,
            height: 1.2,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 8,),
      launch.details == null ? Container() : ListTile(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Text(
            launch.details!,
            style: const TextStyle(
                color: Colors.white,
                height: 1.2,
                fontSize: 16,
              ),
          ),
        ),
      ),
    ],
  );
}