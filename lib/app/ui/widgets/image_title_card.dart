import 'package:flutter/material.dart';

class ImageTitleCard extends StatelessWidget {
  const ImageTitleCard({
    super.key,
    required this.child,
    required this.title,
    required this.onTap,
    this.borderRadius = 10,
  });

  final Widget child;
  final String? title;
  final Function() onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => Card(
    color: Colors.transparent,
    elevation: 1.0,
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius)
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          SizedBox(height: 250, child: child),
          SizedBox(
            height: 250,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    )
  );
}