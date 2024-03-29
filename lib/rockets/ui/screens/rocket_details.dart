import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/app/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/rockets/bloc/rocket_details/rocket_details_cubit.dart';
import 'package:spacex_guide/rockets/data/models/rocket.dart';
import 'package:spacex_guide/rockets/ui/widgets/rocket_info.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    super.key, 
    required this.rocket, 
  });

  final RocketModel rocket;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RocketDetailsCubit()..loadDetails(),
    child: _willPopScope,
  );
  
  Widget get _willPopScope => PopScope(
    canPop: true,
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
        return RocketInfo(
          rocket: rocket,
          allLaunches: state.launches,
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  ); 
}