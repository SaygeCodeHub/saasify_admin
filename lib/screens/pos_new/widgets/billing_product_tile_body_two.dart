import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';

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
        Row(children: [
          InkWell(
            onTap: () {
              context.read<BillingBloc>().add(RemoveProduct(
                  productsByCategories: posData,
                  product: selectedProduct.product));
            },
            child: Container(
              height: kCounterContainerSize,
              width: kCounterContainerSize,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.saasifyLightDeepBlue),
              ),
              child: const Center(
                  child: Icon(
                Icons.remove,
                size: kGeneralRadius,
              )),
            ),
          ),
          Container(
            height: kCounterContainerSize,
            width: kCounterContainerSize,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.saasifyLightDeepBlue),
            ),
            child: Center(
                child: Text(selectedProduct.count.toString(),
                    style: Theme.of(context).textTheme.xxTiniest)),
          ),
          InkWell(
              onTap: () {
                context.read<BillingBloc>().add(SelectProduct(
                    variantIndex: 0,
                    productsByCategories: posData,
                    product: selectedProduct.product));
              },
              child: Container(
                  height: kCounterContainerSize,
                  width: kCounterContainerSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.saasifyLightDeepBlue),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    size: kGeneralRadius,
                  ))))
        ])
      ])
    ]);
  }
}
