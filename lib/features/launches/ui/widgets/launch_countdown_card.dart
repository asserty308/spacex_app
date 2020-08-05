import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown.dart';

class LaunchCountdownCard extends StatelessWidget {
  const LaunchCountdownCard({
    Key key,
    @required this.launch,
    this.showLaunchOnTap = true,
  }) : super(key: key);

  final LaunchModel launch;
  final bool showLaunchOnTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: _card(context),
  );

  // Widgets 

  Widget _card(BuildContext context) => Card(
    elevation: 1.0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    color: Colors.indigo,
    child: _cardContent(context),
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
      
    BlocProvider.of<LaunchesNavigationCubit>(context).showLaunchDetails(context, launch);
  }
}