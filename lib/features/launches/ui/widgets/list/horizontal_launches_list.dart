import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class HorizontalLaunchesList extends StatelessWidget {
  const HorizontalLaunchesList({
    super.key, 
    required this.launches
  });

  final List<LaunchModel> launches;
  final double height = 140.0;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      itemCount: launches.length,
      itemBuilder: (context, index) {
        final launch = launches[index];
        return _item(context, launch);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 16,),
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
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: Text(
                launch.name ?? 'Unbekannt', 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2, 
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    ),
  );
}