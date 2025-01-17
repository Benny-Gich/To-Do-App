import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.lightGreen.shade200,
    onSecondary: Colors.black,
    error: Colors.lightGreen.shade200,
    onError: Colors.redAccent.shade200,
    surface: Colors.lightGreen.shade100,
    onSurface: Colors.black,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black87,
    onPrimary: Colors.green,
    secondary: Colors.green.shade900,
    onSecondary: Colors.white70,
    error: Colors.green,
    onError: Colors.redAccent.shade200,
    surface: Colors.black87,
    onSurface: Colors.green,
  ),
);
