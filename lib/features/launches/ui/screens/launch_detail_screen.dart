import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_events.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_states.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatefulWidget {
  const LaunchDetailScreen(this.launch);

  final Launch launch;

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _bloc = LaunchDetailsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadLaunchDetails(widget.launch));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        body: _blocBuilder,
      ),
      onWillPop: () async {
        _dismissScreen();
        return false;
      },
    );
  }

  // Widget

  Widget get _blocBuilder => BlocBuilder(
    cubit: _bloc,
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

  Widget _body(LaunchDetailsStateLoaded state) => NestedScrollView(
    headerSliverBuilder: (context, innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _dismissScreen(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: ImageCarousel(
              imageUrls: state.imageUrls,
            ),
          ),
        )
      ];
    },
    body: Container(
      child: LaunchInfo(
        launch: widget.launch,
      ),
    )
  );

  // Function

  void _dismissScreen() {
    //BlocProvider.of<LaunchesNavigationBloc>(context).popState();
    Navigator.of(context).pop();
  }
}