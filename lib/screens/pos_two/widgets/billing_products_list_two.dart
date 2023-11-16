import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'billing_product_tile_body_two.dart';

class BillingProductsListTwo extends StatelessWidget {
  const BillingProductsListTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColor.saasifyWhite,
        borderRadius: BorderRadius.circular(kGeneralRadius),
      ),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              const SizedBox(height: spacingXSmall),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: spacingSmall, vertical: spacingSmall),
                child: Row(children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      'assets/cake_img.png',
                    ),
                  ),
                  const SizedBox(width: spacingSmall),
                  const Expanded(child: BillingProductTileBodyTwo())
                ]));
          }),
    );
  }
}
