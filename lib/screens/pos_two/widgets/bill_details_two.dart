import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillDetailsTwo extends StatelessWidget {
  const BillDetailsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.saasifyWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingStandard,
            right: spacingStandard,
            top: spacingSmall,
            bottom: spacingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sub Total',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: spacingStandard,
                ),
                Text('₹1230',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(color: AppColor.saasifyGreyBlue)),
              ],
            ),
            const SizedBox(
              height: spacingSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('₹0',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(color: AppColor.saasifyGreyBlue)),
              ],
            ),
            const Divider(color: AppColor.saasifyGreyBlue),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Grand Total',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('₹1230',
                    style: Theme.of(context)
                        .textTheme
                        .tiniest
                        .copyWith(color: AppColor.saasifyGreyBlue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
