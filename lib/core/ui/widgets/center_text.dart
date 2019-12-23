import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  CenterText(
    this.text, {this.style}
  );

  String text;
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: style,
      ),
    );
  }
}