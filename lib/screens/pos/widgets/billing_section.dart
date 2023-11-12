import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import 'billing_products_list.dart';
import 'billing_section_footer.dart';
import 'billing_section_header.dart';

class BillingSection extends StatelessWidget {
  final List<SelectedProductModel> selectedProducts;
  final List<CategoryWithProductsDatum> productsByCategories;
  final BillModel billDetails;

  const BillingSection({
    super.key,
    required this.selectedProducts,
    required this.productsByCategories,
    required this.billDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.saasifyLightWhite,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(kGeneralRadius))),
      child: Padding(
        padding: const EdgeInsets.all(spacingSmall),
        child: Column(
          children: [
            BillingSectionHeader(
                productsByCategories: productsByCategories,
                billDetails: billDetails),
            const SizedBox(height: spacingStandard),
            BillingProductsList(
              selectedProducts: selectedProducts,
              productsByCategories: productsByCategories,
              billDetails: billDetails,
            ),
            const SizedBox(height: spacingSmall),
            BillingSectionFooter(
                selectedProducts: selectedProducts, billDetails: billDetails),
          ],
        ),
      ),
    );
  }
}
