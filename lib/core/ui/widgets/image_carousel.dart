import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/progress_indicator.dart';

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
      height: double.infinity, // set big height to make the images fit inside the given space without bottom border
      viewportFraction: 1.0, // make image use the full screen width
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 5),
      pauseAutoPlayOnTouch: const Duration(seconds: 5),
      enlargeCenterPage: false,
      enableInfiniteScroll: widget.imageUrls.length > 1, // disable scroll when only one image available
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
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => MyProgressIndicator(),
        errorWidget: (context, url, error) => const Center(
          child: Text(
            'No image available',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
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