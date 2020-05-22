import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/utility/extensions/int_duration.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key key,
    this.imageUrls,
  }) : super(key: key);

  final List<String> imageUrls;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity, // set big height to make the images fit inside the given space without bottom border
        viewportFraction: 1.0, // make image use the full screen width
        autoPlay: true,
        autoPlayInterval: 5.toSeconds(),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: false,
        enableInfiniteScroll: widget.imageUrls.length > 1,
      ),
      items: mapFromUrls(
        widget.imageUrls, 
        (index, imgUrl) {
          return buildImageContainer(context, imgUrl);
        },
      )
    );
  }

  Container buildImageContainer(BuildContext context, imgUrl) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  List<Widget> mapFromUrls(List list, Function handler) {
    final result = <Widget>[];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}