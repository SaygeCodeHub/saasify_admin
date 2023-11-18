import 'package:flutter/material.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import 'bill_details_two.dart';
import 'billing_products_list_two.dart';
import 'billing_section_footer_two.dart';
import 'billing_section_header_two.dart';

class BillingSectionTwo extends StatelessWidget {
  const BillingSectionTwo({super.key, required this.posData});

  final List<CategoryWithProductsDatum> posData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(spacingMedium),
        decoration: const BoxDecoration(color: AppColor.saasifyLightGreyBlue),
        child: Column(children: [
          const BillingSectionHeaderTwo(),
          const SizedBox(height: spacingXXSmall),
          BillingProductsListTwo(posData: posData),
          const SizedBox(height: spacingSmall),
          BillDetailsTwo(),
          const SizedBox(height: spacingMedium),
          const BillingSectionFooterTwo()
        ]));
  }
}
