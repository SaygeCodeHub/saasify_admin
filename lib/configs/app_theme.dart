import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_spacing.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.sassifyLightestGrey),
    ),
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingMedium, vertical: spacingMedium),
    fillColor: AppColor.sassifyLightestGrey,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.sassifyRed),
    ),
    border: const OutlineInputBorder(),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.sassifyRed)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.sassifyLightestGrey),
    ),
    hintStyle: const TextStyle(color: AppColor.sassifySlateBlueGrey));

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  labelMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
);
