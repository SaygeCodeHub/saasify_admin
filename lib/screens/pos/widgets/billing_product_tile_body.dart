import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';

class BillingProductTileBody extends StatelessWidget {
  const BillingProductTileBody({
    super.key,
    required this.selectedProducts,
    required this.productsByCategories,
    required this.index,
  });

  final int index;
  final List<SelectedProductModel> selectedProducts;
  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              selectedProducts[index].product.productName,
              maxLines: 2,
              style: const TextStyle(),
            )),
            const SizedBox(width: spacingMedium),
            Text(
                '₹${selectedProducts[index].product.variants[0].cost.toString()}',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLightDeepBlue))
          ],
        ),
      ),
      Text(selectedProducts[index].product.variants[0].stock.toString(),
          style: Theme.of(context)
              .textTheme
              .xTiniest
              .copyWith(color: AppColor.saasifyGrey)),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(children: [
          InkWell(
            onTap: () {
              context.read<BillingBloc>().add(RemoveProduct(
                  product: selectedProducts[0].product,
                  productsByCategories: productsByCategories));
            },
            child: Container(
              height: kCounterContainerSize,
              width: kCounterContainerSize,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.saasifyLightDeepBlue),
              ),
              child: const Center(child: Icon(Icons.remove)),
            ),
          ),
          Container(
            height: kCounterContainerSize,
            width: kCounterContainerSize,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.saasifyLightDeepBlue),
            ),
            child: Center(
                child: Text(selectedProducts[0].count.toString(),
                    style: Theme.of(context).textTheme.tiniest)),
          ),
          InkWell(
              onTap: () {
                context.read<BillingBloc>().add(SelectProduct(
                    product: selectedProducts[0].product,
                    productsByCategories: productsByCategories,
                    variantIndex: 0));
              },
              child: Container(
                  height: kCounterContainerSize,
                  width: kCounterContainerSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.saasifyLightDeepBlue),
                  ),
                  child: const Center(child: Icon(Icons.add))))
        ])
      ])
    ]);
  }
}
