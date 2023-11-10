import 'package:flutter/material.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import 'billing_products_list.dart';
import 'billing_section_footer.dart';
import 'billing_section_header.dart';

class BillingSection extends StatelessWidget {
  const BillingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.saasifyWhite,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(spacingXMedium))),
      child: const Padding(
        padding: EdgeInsets.all(spacingLarger),
        child: Column(
          children: [
            BillingSectionHeader(),
            SizedBox(height: spacingXMedium),
            BillingProductsList(),
            SizedBox(height: spacingXXSmall),
            BillingSectionFooter(),
          ],
        ),
      ),
    );
  }
}
