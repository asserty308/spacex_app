import 'package:flutter/material.dart';

class DefaultScreenError extends StatelessWidget {
  const DefaultScreenError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something went wrong. Please try again later',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}