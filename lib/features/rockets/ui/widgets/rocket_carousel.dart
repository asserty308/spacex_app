import 'package:flutter/material.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_card.dart';

bool shouldReloadRocketCarousel = false;

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

    // run 'afterFirstlayout' after first build()
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // update state when popping back from rocket details to make the pages appear correctly
    if (shouldReloadRocketCarousel) {
      shouldReloadRocketCarousel = false;

      // wait for previous setState to finish
      Future.delayed(const Duration(milliseconds: 1), () {
        afterFirstLayout(context);
      });
    }

    return Container(
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        pageSnapping: true,
        controller: _controller,
        itemCount: globalRocketData.length,
        itemBuilder: (context, index) => builder(context, index)
      ),
    );
  }

  void afterFirstLayout(BuildContext context) {
    // on the first render, the pageController.page is null
    setState(() {});
  }

  Widget builder(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // calculate the height of each page
        // the current page should be larger than its direct neigbors (70% of main height)
        double heightFactor = 1.0;
        if (_controller.position.haveDimensions) {
          heightFactor = _controller.page - index;
          heightFactor = (1 - (heightFactor.abs() * .3)).clamp(0.0, 1.0);
        }

        return buildRocketPage(context, index, heightFactor);
      },
    );
  }

  Widget buildRocketPage(BuildContext context, int index, double heightFactor) {
    final rocket = globalRocketData[index];
    
    return GestureDetector(
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
}