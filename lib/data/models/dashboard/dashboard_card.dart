import 'package:flutter/material.dart';

class DashboardCardData {
  final IconData iconName;
  final String routeName;
  final String title;
  final Color color;
  String subtitle;

  DashboardCardData({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.routeName,
    required this.iconName,
  });
}
