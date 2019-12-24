import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/center_text.dart';

class DefaultScreenError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenterText(
      'Something went wrong. Please try again later',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}