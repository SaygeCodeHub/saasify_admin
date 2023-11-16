import 'package:flutter/material.dart';
import 'package:saasify/screens/pos_new/widgets/billing_section_two.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import 'pos_screen_left_part.dart';

class POSTwoScreen extends StatelessWidget {
  static const routeName = 'POSTwoScreen';

  const POSTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          height: kImageHeight,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColor.saasifyLightDeepBlue,
          ),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: spacingXLarge),
                  child: Icon(Icons.menu,
                      color: AppColor.saasifyWhite, size: spacingXHuge)))),
      const Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(flex: 7, child: POSScreenLeftPart()),
          Expanded(flex: 3, child: BillingSectionTwo()),
        ]),
      )
    ]));
  }
}
