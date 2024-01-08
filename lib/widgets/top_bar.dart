import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

import '../configs/app_colors.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String headingText;

  const TopBar(
      {super.key, required this.scaffoldKey, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryAccent,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacingSmall, horizontal: spacingLarge),
            child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                iconSize: 30,
                icon: const Icon(Icons.menu)),
          ),
          Text(headingText,
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w500)),
        ]));
  }
}
