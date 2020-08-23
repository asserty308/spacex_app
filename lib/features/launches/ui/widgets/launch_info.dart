import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_info/launch_info_cubit.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_actions.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

import 'launch_countdown_card.dart';

class LaunchInfo extends StatelessWidget {
  const LaunchInfo({
    Key key,
    this.launch
  }) : super(key: key);

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LaunchInfoCubit(
      rocketRepository: RepositoryProvider.of(context),
      launchpadRepository: RepositoryProvider.of(context),
    )..loadData(launch),
    child: _body,
  );

  Widget get _body => BlocBuilder<LaunchInfoCubit, LaunchInfoState>(
    builder: (context, state) {
      if (state is LaunchInfoLoaded) {
        return _listView(state.rocket, state.launchpad);
      }

      return Container();
    },
  );
  
  Widget _listView(RocketModel rocket, LaunchpadModel launchpad) => ListView(
    padding: EdgeInsets.only(top: 24),
    children: <Widget>[
      ListTile(
        leading: launch.links.patchSmall != null ? Image.network(launch.links.patchSmall) : null,
      ),
      !launch.upcoming ? LaunchDetailActions(launch: launch,) : LaunchCountdownCard(launch: launch, showLaunchOnTap: false,),
      const SizedBox(height: 8,),
      ListTile(
        title: Text(
          launch.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          launch.formattedLaunchDate(),
          style: const TextStyle(
            color: Colors.white,
            height: 1.2,
            fontSize: 16,
          ),
        ),
      ),
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
          rocket.name,
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
            launch.details,
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