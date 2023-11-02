import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../configs/app_spacing.dart';

class HeaderWidget extends StatelessWidget {
  static const routeName = 'HeaderWidget';

  final bool isFromSignUp;

  const HeaderWidget({super.key, this.isFromSignUp = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingMedium, vertical: spacingStandard),
            child: Row(children: [
              SvgPicture.asset('assets/app_logo.svg'),
              const SizedBox(width: spacingMedium),
              Text('SaaSify', style: Theme.of(context).textTheme.titleLarge),
            ])));
  }
}
