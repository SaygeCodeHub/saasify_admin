import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

import '../configs/app_colors.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String headingText;
  final bool backButtonVisible;

  const TopBar(
      {super.key,
      required this.scaffoldKey,
      required this.headingText,
      this.backButtonVisible = false});

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
          Visibility(
            visible: backButtonVisible,
            child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new))),
          ),
          Text(headingText,
              style: Theme.of(context)
                  .textTheme
                  .xTiny
                  .copyWith(fontWeight: FontWeight.w700)),
        ]));
  }
}
