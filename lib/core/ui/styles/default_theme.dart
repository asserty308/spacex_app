import 'package:flutter/material.dart';

const _backgroundColorDark = Color.fromARGB(255, 33, 33, 33);
const _backgroundColorLight = Color.fromARGB(255, 200, 200, 200);

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: _backgroundColorDark,
    elevation: 0,
  ),
  scaffoldBackgroundColor: _backgroundColorDark,
);

final lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: _backgroundColorLight,
    elevation: 0,
  ),
  scaffoldBackgroundColor: _backgroundColorLight,
);