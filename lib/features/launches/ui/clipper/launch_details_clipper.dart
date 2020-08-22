import 'package:flutter/rendering.dart';

class LaunchDetailsClipper extends CustomClipper<Path> {
  LaunchDetailsClipper({
    this.heightPx, 
    this.heightPercentage = 0
  });

  final double heightPx, heightPercentage;

  @override
  Path getClip(Size size) {
    final height = heightPx.clamp(0, size.height) ?? size.height * heightPercentage.clamp(0, 1);

    final controlPoint = Offset(size.width / 1.5, height / 3);
    final endPoint = Offset(0, 0);
    final bezier = Path();
    bezier.lineTo(size.width, 0);
    bezier.lineTo(size.width, height);
    bezier.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      bezier,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}