import 'package:flutter/material.dart';
import '../../../configs/app_spacing.dart';
import 'bill_details.dart';
import 'billing_product_tile_body.dart';

class BillingProductsList extends StatelessWidget {
  const BillingProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            const SizedBox(height: spacingXXSmall),
        itemBuilder: (context, index) {
          if (5 > index) {
            return const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: spacingXHuge),
                BillDetails(),
              ],
            );
          }
          return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: spacingLarger, vertical: spacingSmall),
                  child: Row(children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        'assets/cake_img.png',
                      ),
                    ),
                    const SizedBox(width: spacingStandard),
                    const Expanded(child: BillingProductTileBody())
                  ])));
        },
      ),
    );
  }
}
