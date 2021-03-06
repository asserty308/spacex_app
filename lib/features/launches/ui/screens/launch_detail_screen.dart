import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_cubit.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatelessWidget {
  LaunchDetailScreen({
    Key? key, 
    required this.launch,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final LaunchModel launch;

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async {
      _dismissScreen(context);
      return false;
    },
    child: Scaffold(
      key: _scaffoldKey,
      body: _stateBuilder,
      appBar: AppBar(
        title: Row(
          children: [
            if (launch.links?.patchSmall != null)
              Image.network(launch.links!.patchSmall!, width: 40, height: 40,).paddingOnly(right: 16),
            Text(launch.name ?? 'Unbekannter Name'),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
    ),
  );

  Widget get _stateBuilder => BlocBuilder<LaunchDetailsCubit, LaunchDetailsState>(
    bloc: GetIt.I<LaunchDetailsCubit>()..loadLaunchDetails(launch),
    builder: (context, state) {
      if (state is LaunchDetailsStateLoading) {
        return CenterProgressIndicator();
      }

      if (state is LaunchDetailsStateLoaded) {
        return _body(state);
      }
      
      return Container();
    },
  );

  Widget _body(LaunchDetailsStateLoaded state) => Stack(
    children: [
      ImageCarousel(imageUrls: state.imageUrls,),
      _launchInfoBody,
    ],
  );

  Widget get _launchInfoBody => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black26, Colors.black],
        stops: [0.0, 0.8] // bottom 20% are black
      )
    ),
    child: _launchInfo,
  );

  Widget get _launchInfo => LaunchInfo(
    launch: launch,
  ).paddingOnly(top: 60);

  // Function

  void _dismissScreen(BuildContext context) => Navigator.of(context).pop();
}
