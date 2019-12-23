import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';

class RocketCarousel extends StatefulWidget {
  @override
  _RocketCarouselState createState() => _RocketCarouselState();
}

class _RocketCarouselState extends State<RocketCarousel> {
  PageController controller;
  int currentpage = 0;
  bool viewIsReady = false; 

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.8, // width each page can use (relative to the parent)
    );

    // run 'afterFirstlayout' after first build()
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentpage = value;
            });
          },
          pageSnapping: true,
          controller: controller,
          itemCount: golbalRocketData.length,
          itemBuilder: (context, index) => builder(context, index)
        ),
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
      animation: controller,
      builder: (context, child) {
        double value = 1.0;

        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .3)).clamp(0.0, 1.0);
        }

        final rocket = golbalRocketData[index];

        return GestureDetector(
          onTap: () => showScreen(context, RocketDetailsScreen(rocket: rocket)),
          child: Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * (MediaQuery.of(context).size.height * 0.8),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 1.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CachedNetworkImage(imageUrl: rocket.flickrImages[0], fit: BoxFit.cover,),
                    Container(
                      color: Colors.white30,
                    ),
                    Center(
                      child: Text(
                        rocket.name,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black26,
                              offset: const Offset(1.0, 1.0),
                            ),
                          ]
                        ),
                      )
                    )
                  ]
                )
              )
            ),
          ),
        );
      },
      /*child: Container(
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),*/
    );
  }
}