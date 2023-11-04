import 'dart:developer';

import 'package:flutter/material.dart';
import 'globals.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? tablets,
    T? desktop,
    T? widescreen,
  }) {
    log(screenWidth.toString());
    final wd = MediaQuery.sizeOf(this).width;
    log(wd.toString());
    return wd >= 2000
        ? (widescreen ?? desktop ?? defaultVal)
        : wd >= 1440
            ? (desktop ?? tablets ?? defaultVal)
            : wd >= 1000
                ? (tablets ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}
