import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? tablets,
    T? desktop,
    T? widescreen,
    T? mobile,
    T? iPhone12,
  }) {
    double wd = MediaQuery.sizeOf(this).width;
    return wd >= 2000
        ? (widescreen ?? desktop ?? defaultVal)
        : wd >= 1500
            ? (desktop ?? tablets ?? defaultVal)
            : wd >= 1000
                ? (tablets ?? defaultVal)
                : wd >= 400
                    ? (mobile ?? defaultVal)
                    : wd >= 200
                        ? (iPhone12 ?? defaultVal)
                        : defaultVal;
  }
}
