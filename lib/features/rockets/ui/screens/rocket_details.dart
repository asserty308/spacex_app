import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/rockets/bloc/rocket_details/rocket_details_cubit.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_info.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    Key? key, 
    required this.rocket, 
  }) : super(key: key);

  final RocketModel rocket;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RocketDetailsCubit()..loadDetails(),
    child: _willPopScope,
  );
  
  Widget get _willPopScope => WillPopScope(
    onWillPop: () async {
      return true;
    },
    child: _scaffold,
  );

  // Widgets

  Widget get _scaffold => Scaffold(
    body: _scrollView,
  );

  Widget get _scrollView => NestedScrollView(
    headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
      _sliverAppBar,
    ],
    body: _body,
  );

  Widget get _sliverAppBar => SliverAppBar(
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: ImageCarousel(
        imageUrls: rocket.flickrImages,
      ),
    ),
  );

  Widget get _body => BlocBuilder<RocketDetailsCubit, RocketDetailsState>(
    builder: (context, state) {
      if (state is RocketDetailsLoaded) {
        return Container(
          child: RocketInfo(
            rocket: rocket,
            allLaunches: state.launches,
          ),
        );
      }

      return CenterProgressIndicator();
    }
  ); 
}