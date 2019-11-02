import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedLaunchImages extends StatefulWidget {
  AnimatedLaunchImages({
    Key key,
    this.imageUrls,
  }) : super(key: key);

  final List<String> imageUrls;

  @override
  _AnimatedLaunchImagesState createState() => _AnimatedLaunchImagesState();
}

class _AnimatedLaunchImagesState extends State<AnimatedLaunchImages> {
  var _imageIndex = 0;
  List<Image> _images = List();

  @override
  Widget build(BuildContext context) {
    loadImages();
    startAnimation();

    return Container(
      height: 200,
      child: _images.isEmpty ? Center(child: CircularProgressIndicator()) : _images[_imageIndex],
    );
  }

  void loadImages() {
    if (widget.imageUrls == null || widget.imageUrls.isEmpty) {
      return;
    }

    for (var url in widget.imageUrls) {
      _images.add(Image.network(url));
    }

    setState(() {
    });
  }

  void startAnimation() {
    if (widget.imageUrls == null || widget.imageUrls.isEmpty) {
      return;
    }

    final delay = Duration(seconds: 10);
    Timer.periodic(delay, (timer) {
      setState(() {
        //_imageVisible = !_imageVisible;
        _imageIndex = (_imageIndex + 1) % _images.length;
      });
    });
  }
}