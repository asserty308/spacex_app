import 'package:flutter/material.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';

class DefaultScreenError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Something went wrong. Please try again later',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ).centered;
  }
}