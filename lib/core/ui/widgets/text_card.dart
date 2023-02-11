import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    this.text,
    this.backgroundColor = Colors.indigo,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String? text;
  final Color backgroundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              height: 1.2,
              fontSize: 16,
            ),
          ),
        )
      )
    );
  }
}