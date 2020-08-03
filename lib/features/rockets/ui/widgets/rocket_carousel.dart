import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/features/rockets/bloc/rocket_list/rocket_carousel_cubit.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_card.dart';

class RocketCarousel extends StatefulWidget {
  @override
  _RocketCarouselState createState() => _RocketCarouselState();
}

class _RocketCarouselState extends State<RocketCarousel> {
  PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: _currentPage,
      keepPage: true,
      viewportFraction: 0.825, // width each page can use (relative to the parent)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RocketCarouselCubit(
      rocketsRepository: RepositoryProvider.of(context),
    )..loadRockets(),
    child: _body,
  );

  // Widgets

  Widget get _body => BlocBuilder<RocketCarouselCubit, RocketCarouselState>(
    builder: (context, state) {
      if (state is RocketCarouselLoading) {
        return CenterProgressIndicator();
      }

      if (state is RocketCarouselLoaded) {
        return _rocketCarousel(state.allRockets);
      }

      return Container();
    },
  );
  
  Widget _rocketCarousel(List<Rocket> rockets) => Container(
    child: PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _currentPage = value;
        });
      },
      pageSnapping: true,
      controller: _controller,
      itemCount: rockets.length,
      itemBuilder: (context, index) => builder(context, index, rockets[index]),
    ),
  );

  Widget builder(BuildContext context, int index, Rocket rocket) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      // calculate the height of each page
      // the current page should be larger than its direct neigbors (70% of main height)
      double heightFactor = 1.0;
      if (_controller.position.haveDimensions) {
        heightFactor = _controller.page - index;
        heightFactor = (1 - (heightFactor.abs() * .3)).clamp(0.0, 1.0);
      }

      return buildRocketPage(context, index, rocket, heightFactor);
    },
  );

  Widget buildRocketPage(BuildContext context, int index, Rocket rocket, double heightFactor) => GestureDetector(
    onTap: () => showScreen(
      context, 
      RocketDetailsScreen(
        rocket: rocket,
      )
    ),
    child: Center(
      child: SizedBox(
        height: Curves.easeOut.transform(heightFactor) * (MediaQuery.of(context).size.height * 0.8),
        child: RocketCard(rocket: rocket),
      ),
    ),
  );
}