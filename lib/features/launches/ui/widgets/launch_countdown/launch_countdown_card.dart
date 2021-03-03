import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

part 'launch_countdown_text.dart';

class LaunchCountdownCard extends StatelessWidget {
  const LaunchCountdownCard({
    Key? key,
    required this.launch,
    this.showLaunchOnTap = true,
  }) : super(key: key);

  final LaunchModel launch;
  final bool showLaunchOnTap;

  @override
  Widget build(BuildContext context) => _body(context);

  // Widgets 

  /// Only show the countdown when the launch has been scheduled
  Widget _body(BuildContext context) => launch.isScheduled ? _card(context) : Container();

  Widget _card(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.indigo,
      child: _cardContent(context),
    ),
  );

  Widget _cardContent(BuildContext context) => InkWell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _title,
          const SizedBox(height: 8,),
          _countdown
        ],
      ),
    ),
    onTap: () => _onTap(context),
  );

  Widget get _title => Text(
    '${launch.name} will launch in', 
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.white, 
      fontSize: 18, 
      fontWeight: FontWeight.bold
    ),
  );

  Widget get _countdown => LaunchCountdown(
    launch: launch,
    textSize: 22,
  );

  // Functions

  void _onTap(BuildContext context) {
    if (!showLaunchOnTap) {
      return;
    }
      
    GetIt.I<LaunchesNavigationCubit>().showLaunchDetails(context, launch);
  }
}