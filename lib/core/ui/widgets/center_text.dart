import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  const CenterText(
    this.text, {this.style}
  );

  final String text;
  final TextStyle style;

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