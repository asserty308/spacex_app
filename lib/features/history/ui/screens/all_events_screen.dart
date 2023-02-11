import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/core/ui/widgets/default_texts.dart';
import 'package:spacex_guide/features/history/bloc/all_events_list/all_events_list_cubit.dart';
import 'package:spacex_guide/features/history/ui/widgets/all_events_list.dart';

class AllEventsScreen extends StatelessWidget {
  const AllEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppScaffold(
    title: const Text('All Events'),
    body: _eventList,
  );

  Widget get _eventList => BlocBuilder<AllEventsListCubit, AllEventsListState>(
    bloc: GetIt.I<AllEventsListCubit>()..getAllEvents(),
    builder: (context, state) {
      if (state is AllEventsListLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is AllEventsListLoaded) {
        return AllEventsList(events: state.allEvents,);
      }

      return const DefaultScreenError();
    },
  );
}