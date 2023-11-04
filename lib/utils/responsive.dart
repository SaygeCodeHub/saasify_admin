import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? tablets,
    T? desktop,
    T? widescreen,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 2000
        ? (widescreen ?? desktop ?? defaultVal)
        : wd >= 1440
            ? (desktop ?? defaultVal)
            : wd >= 1000
                ? (tablets ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}
