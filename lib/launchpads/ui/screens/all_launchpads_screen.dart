import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/app/ui/widgets/default_texts.dart';
import 'package:spacex_guide/launchpads/bloc/launchpad_list/launchpad_list_cubit.dart';
import 'package:spacex_guide/launchpads/ui/widgets/launchpad_list.dart';

class AllLaunchpadsScreen extends StatelessWidget {
  const AllLaunchpadsScreen({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
    title: const Text('All Launchpads'),
    body: _stateHandler,
  );
  
  Widget get _stateHandler => BlocBuilder(
    bloc: GetIt.I<AllLaunchpadsCubit>()..loadData(),
    builder: (context, dynamic state) {
      if (state is AllLaunchpadsInitial || state is AllLaunchpadsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is AllLaunchpadsLoaded) {
        return LaunchpadList(launchpads: state.allLaunchpads);
      }

      return const DefaultScreenError();
    }
  );
}
