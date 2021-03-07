import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';

class HorizontalLaunchesList extends StatelessWidget {
  const HorizontalLaunchesList({
    Key? key, 
    required this.launches
  }) : super(key: key);

  final List<LaunchModel> launches;
  final double height = 140.0;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 16, right: 16),
      itemCount: launches.length,
      itemBuilder: (context, index) {
        final launch = launches[index];
        return _item(context, launch);
      },
      separatorBuilder: (context, index) => SizedBox(width: 16,),
    ),
  );

  Widget _item(BuildContext context, LaunchModel launch) => InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () => GetIt.I<LaunchesNavigationCubit>().showLaunchDetails(context, launch),
    child: Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.network(launch.links?.patchSmall ?? '', width: double.infinity, height: height - 40),
          Container(
            width: double.infinity,
            height: 40,
            child: Text(
              launch.name ?? 'Unbekannt', 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ).centered,
          )
        ],
      ),
    ),
  );
}