import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_cubit.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/clipper/launch_details_clipper.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final LaunchModel launch;

  LaunchDetailScreen({
    Key key, 
    @required this.launch
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LaunchDetailsCubit(
      rocketRepository: RepositoryProvider.of(context),
    )..loadLaunchDetails(launch),
    child: _willPopScope,
  );

  // Widgets
  
  Widget get _willPopScope => Builder(
    builder: (context) => WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        body: _blocBuilder,
      ),
      onWillPop: () async {
        _dismissScreen(context);
        return false;
      },
    ),
  );
  
  

  Widget get _blocBuilder => BlocBuilder<LaunchDetailsCubit, LaunchDetailsState>(
    builder: (context, state) {
      if (state is LaunchDetailsStateLoading) {
        return CenterProgressIndicator();
      }

      if (state is LaunchDetailsStateLoaded) {
        return _body2(state);
      }
      
      return Container();
    },
  );

  // Widget _body(LaunchDetailsStateLoaded state) => SliverScrollView(
  //   header: ImageCarousel(
  //     imageUrls: state.imageUrls,
  //   ), 
  //   body: Container(
  //     child: LaunchInfo(
  //       launch: launch,
  //     ),
  //   ),
  //   onBackPressed: (context) => _dismissScreen(context),
  // );

  Widget _body2(LaunchDetailsStateLoaded state) => Stack(
    children: [
      ImageCarousel(imageUrls: state.imageUrls,),
      Padding(
        padding: EdgeInsets.only(top: 100),
        child: ClipPath(
          clipper: LaunchDetailsClipperClipper(heightPx: 100),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black26, Colors.black],
              )
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 200),
        child: Container(
          child: LaunchInfo(
            launch: launch,
          )
        )
      ),
    ],
  );

  // Function

  void _dismissScreen(BuildContext context) => Navigator.of(context).pop();
}
