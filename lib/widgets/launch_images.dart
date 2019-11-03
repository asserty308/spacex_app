import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LaunchImages extends StatefulWidget {
  LaunchImages({
    Key key,
    this.imageUrls,
  }) : super(key: key);

  final List<String> imageUrls;

  @override
  _LaunchImagesState createState() => _LaunchImagesState();
}

class _LaunchImagesState extends State<LaunchImages> {
  var _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: CachedNetworkImage(
        imageUrl: widget.imageUrls.isEmpty ? '' : widget.imageUrls[_imageIndex],
        fit: _imageIndex == 0 ? BoxFit.contain : BoxFit.cover, // always show full badge
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(
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

  void startAnimation() {
    final delay = Duration(seconds: 20);
    Timer.periodic(delay, (timer) {
      // no animation needed when only one image available
      if (widget.imageUrls == null || widget.imageUrls.length < 2 || !this.mounted) {
        return;
      }

      setState(() {
        //_imageVisible = !_imageVisible;
        _imageIndex = (_imageIndex + 1) % widget.imageUrls.length;
      });
    });
  }
}