import 'package:flutter/material.dart';
import 'package:saasify/screens/pos_two/widgets/billing_section_two.dart';

import '../../configs/app_color.dart';

class POSTwoScreen extends StatelessWidget {
  static const routeName = 'POSTwoScreen';

  const POSTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          height: 70,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColor.saasifyLightDeepBlue,
          ),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Icon(Icons.menu,
                      color: AppColor.saasifyWhite, size: 35)))),
      const Row(mainAxisAlignment: MainAxisAlignment.end, children: [

        BillingSectionTwo(),
      ])
    ]));
  }
}
