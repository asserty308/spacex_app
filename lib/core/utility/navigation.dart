import 'package:flutter/material.dart';

void showScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (BuildContext context) => screen)
    );
  }