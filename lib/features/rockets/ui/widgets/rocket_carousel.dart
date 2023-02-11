import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/rockets/bloc/rocket_list/rocket_carousel_cubit.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_card.dart';

class RocketCarousel extends StatelessWidget {
  final _controller = PageController(
    viewportFraction: 0.825, // width each page can use (relative to the parent)
  );

  RocketCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RocketCarouselCubit()..loadRockets(),
    child: _body,
  );

  // Widgets

  Widget get _body => BlocBuilder<RocketCarouselCubit, RocketCarouselState>(
    builder: (context, state) {
      if (state is RocketCarouselLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is RocketCarouselLoaded) {
        return _rocketCarousel(state.allRockets);
      }

      return Container();
    },
  );
  
  Widget _rocketCarousel(List<RocketModel> rockets) => PageView.builder(
    controller: _controller,
    itemCount: rockets.length,
    itemBuilder: (context, index) => _itemBuilder(context, index, rockets[index]),
    physics: const BouncingScrollPhysics(),
  );

  Widget _itemBuilder(BuildContext context, int index, RocketModel rocket) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      // calculate the height of each page
      // the current page should be larger than its direct neigbors (70% of main height)
      double heightFactor = 1.0;
      if (_controller.position.haveDimensions) {
        heightFactor = _controller.page! - index;
        heightFactor = (1 - (heightFactor.abs() * 0.3)).clamp(0.0, 1.0);
      }

      return _buildRocketCard(context, rocket, heightFactor);
    },
  );

  Widget _buildRocketCard(BuildContext context, RocketModel rocket, double heightFactor) => GestureDetector(
    onTap: () => _showRocketScreen(context, rocket),
    child: Center(
      child: SizedBox(
        height: Curves.easeOut.transform(heightFactor) * (MediaQuery.of(context).size.height * 0.8),
        child: RocketCard(rocket: rocket),
      ),
    ),
  );

  // Functions

  void _showRocketScreen(BuildContext context, RocketModel rocket) => Navigator.of(context).push(
    PageRouteBuilder(pageBuilder: (context, a1, a2) => RocketDetailsScreen(
      rocket: rocket,
    )));
}