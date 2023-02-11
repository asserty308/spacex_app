import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
    this.imageUrls,
  }) : super(key: key);

  final List<String>? imageUrls;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity, // set big height to make the images fit inside the given space without bottom border
        viewportFraction: 1.0, // make image use the full screen width
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: false,
        enableInfiniteScroll: widget.imageUrls!.length > 1,
      ),
      items: mapFromUrls(
        widget.imageUrls!, 
        (index, imgUrl) {
          return _imageContainer(imgUrl);
        },
      )
    );
  }

  Widget _imageContainer(String imgUrl) => SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );

  List<Widget> mapFromUrls(List list, Function handler) {
    final result = <Widget>[];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}