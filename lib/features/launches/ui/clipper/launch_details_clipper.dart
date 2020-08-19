import 'package:flutter/rendering.dart';

class LaunchDetailsClipperClipper extends CustomClipper<Path> {
  LaunchDetailsClipperClipper({
    this.heightPx, 
    this.heightPercentage = 0
  });

  final double heightPx, heightPercentage;

  @override
  Path getClip(Size size) {
    final height = heightPx.clamp(0, size.height) ?? size.height * heightPercentage.clamp(0, 1);

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()..addPolygon([Offset(0, 0), Offset(size.width, 0), Offset(size.width, height)], true)
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}