import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/screens/pos/widgets/bill_details.dart';
import 'package:saasify/screens/pos/widgets/billing_product_tile_body.dart';
import '../../../configs/app_dimensions.dart';

class BillingProductsList extends StatelessWidget {
  const BillingProductsList({
    super.key,
    required this.selectedProducts,
    required this.productsByCategories,
    required this.billDetails,
  });

  final List<SelectedProductModel> selectedProducts;
  final BillModel billDetails;
  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: selectedProducts.length + 1,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            const SizedBox(height: spacingSmall),
        itemBuilder: (context, index) {
          if (selectedProducts.length == index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: spacingSmall),
                BillDetails(billDetails: billDetails),
              ],
            );
          }
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kGeneralRadius)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: spacingSmall, vertical: spacingSmall),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      selectedProducts[index].product.variants[0].images[0],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(width: spacingSmall),
                  Expanded(
                    child: BillingProductTileBody(
                      selectedProducts: selectedProducts,
                      productsByCategories: productsByCategories,
                      index: index,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
