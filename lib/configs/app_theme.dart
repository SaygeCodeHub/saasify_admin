import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme);

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  labelMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
);