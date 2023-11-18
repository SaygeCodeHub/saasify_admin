import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';

class BillingProductTileBodyTwo extends StatelessWidget {
  final SelectedProductModel selectedProduct;
  final List<CategoryWithProductsDatum> posData;

  const BillingProductTileBodyTwo(
      {super.key, required this.selectedProduct, required this.posData});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            selectedProduct.product.productName,
            maxLines: 2,
          )),
          Text('₹ ${selectedProduct.product.variants[0].cost}',
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(color: AppColor.saasifyLightDeepBlue))
        ],
      ),
      Text(
          '${selectedProduct.product.variants[0].quantity} ${selectedProduct.product.variants[0].unit}',
          style: Theme.of(context)
              .textTheme
              .xxxTiniest
              .copyWith(color: AppColor.saasifyGrey)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(StringConstants.kAddInstructions,
            style: Theme.of(context)
                .textTheme
                .xxxTiniest
                .copyWith(color: AppColor.saasifyLightDeepBlue)),
      ])
    ]);
  }
}
