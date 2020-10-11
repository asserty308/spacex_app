import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/core/ui/widgets/default_texts.dart';
import 'package:spacex_guide/features/launchpads/bloc/launchpad_list/launchpad_list_cubit.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_list.dart';

// TODO: Where it makes sense, put state handling to screen - not widget level. 
// This avoids popping widgets due to different loading times and also makes testing easier.

class AllLaunchpadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: const Text('All Launchpads'),
    body: _stateHandler,
  );
  
  Widget get _stateHandler => BlocBuilder<AllLaunchpadsCubit, AllLaunchpadsState>(
    cubit: GetIt.I<AllLaunchpadsCubit>()..loadData(),
    builder: (context, state) {
      if (state is AllLaunchpadsInitial || state is AllLaunchpadsLoading) {
        return CenterProgressIndicator();
      }

      if (state is AllLaunchpadsLoaded) {
        return LaunchpadList(launchpads: state.allLaunchpads);
      }

      return DefaultScreenError();
    }
  );
}
