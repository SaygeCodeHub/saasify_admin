import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class OrderDetailsHeaderWidget extends StatelessWidget {
  const OrderDetailsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.saasifyWhite,
            borderRadius: BorderRadius.circular(kCircularRadius)),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingLarge, vertical: spacingLarge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order ID:123456',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xTiniest
                                      .copyWith(fontWeight: FontWeight.w600)),
                              const SizedBox(height: spacingXSmall),
                              Text('Mon,July 22,2023',
                                  style: Theme.of(context).textTheme.xxTiniest),
                              const SizedBox(height: spacingXXSmall),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColor.saasifyLighterGreen),
                                  child: Text('Approved',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              color: AppColor.saasifyGreen)))
                            ]),
                        // const CustomDropdownTwoWidget(
                        //   listItems: [{
                        //     'one':'event'
                        //   }],),
                      ])
                ])));
  }
}
