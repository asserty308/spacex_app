import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/widgets/default_texts.dart';
import 'package:spacex_guide/features/launchpads/bloc/launchpad_list/launchpad_list_cubit.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_card.dart';

class LaunchpadList extends StatefulWidget {
  const LaunchpadList({
    Key key,
  }) : super(key: key);

  @override
  _LaunchpadListState createState() => _LaunchpadListState();
}

class _LaunchpadListState extends State<LaunchpadList> {
  
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LaunchpadListCubit(
      launchpadRepository: RepositoryProvider.of(context),
    )..loadData(),
    child: _body,
  );
  
  Widget get _body => BlocBuilder<LaunchpadListCubit, LaunchpadListState>(
    builder: (context, state) {
      if (state is LaunchpadListLoading) {
        return CenterProgressIndicator();
      }

      if (state is LaunchpadListLoaded) {
        return buildList(state.allLaunchpads);
      }

      return DefaultScreenError();      
    },
  );

  Widget buildList(List<LaunchpadModel> launchpads) {
    return ListView.builder(
      itemCount: launchpads.length,
      itemBuilder: (context, i) {
        final launchpad = launchpads[i];
        return LaunchpadCard(launchpad: launchpad,);
      }
    );
  }
}