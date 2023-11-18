import 'package:flutter/material.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import 'bill_details_two.dart';
import 'billing_products_list_two.dart';
import 'billing_section_footer_two.dart';
import 'billing_section_header_two.dart';

class BillingSectionTwo extends StatelessWidget {
  const BillingSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(spacingMedium),
        decoration: const BoxDecoration(color: AppColor.saasifyLightGreyBlue),
        child: const Column(children: [
          BillingSectionHeaderTwo(),
          SizedBox(height: spacingXXSmall),
          BillingProductsListTwo(),
          SizedBox(height: spacingSmall),
          BillDetailsTwo(),
          SizedBox(height: spacingMedium),
          Expanded(child: BillingSectionFooterTwo())
        ]));
  }
}
