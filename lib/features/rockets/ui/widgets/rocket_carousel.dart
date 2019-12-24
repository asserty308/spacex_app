import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/center_text.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';

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
      keepPage: false,
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
    return Container(
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        pageSnapping: true,
        controller: _controller,
        itemCount: golbalRocketData.length,
        itemBuilder: (context, index) => builder(context, index)
      ),
    );
  }

  // TODO: Find a way to call this when popping from rocket details
  void afterFirstLayout(BuildContext context) {
    // on the first render, the pageController.page is null
    setState(() {});
  }

  Widget builder(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Future.delayed(const Duration(microseconds: 1), () {
          // update state when popping back from rocket details
          afterFirstLayout(context);
        });
        
        // calculate the height of each page
        // the current page should be larger than the other pages
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page - index;
          value = (1 - (value.abs() * .3)).clamp(0.0, 1.0);
        }

        final rocket = golbalRocketData[index];
        return buildRocketPage(context, rocket, value);
      },
    );
  }

  Widget buildRocketPage(BuildContext context, Rocket rocket, double value) {
    return GestureDetector(
      onTap: () => showScreen(context, RocketDetailsScreen(rocket: rocket)),
      child: Center(
        child: SizedBox(
          height: Curves.easeOut.transform(value) * (MediaQuery.of(context).size.height * 0.8),
          child: buildRocketCard(rocket)
        ),
      ),
    );
  }

  Widget buildRocketCard(Rocket rocket) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            rocket.flickrImages[0],
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color.fromARGB(20, 0, 0, 0),
          ),
          CenterText(
            rocket.name,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.black26,
                  offset: const Offset(1.0, 1.0),
                ),
              ]
            ),
          ),
        ]
      )
    );
  }
}