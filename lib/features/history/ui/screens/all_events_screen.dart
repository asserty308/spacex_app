import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/core/ui/widgets/default_texts.dart';
import 'package:spacex_guide/features/history/ui/widgets/all_events_list.dart';

class AllEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: Text('All Events'),
    child: _eventList,
  );

  Widget get _eventList => globalHistoryData.isNotEmpty ? AllEventsList(events: globalHistoryData,) : DefaultScreenError();
}