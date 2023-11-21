import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'billing_product_tile_body_two.dart';

class BillingProductsList extends StatelessWidget {
  final List<CategoryWithProductsDatum> posData;

  const BillingProductsList({super.key, required this.posData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.saasifyWhite,
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: context.read<BillingBloc>().selectedProducts.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: spacingXSmall),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: spacingSmall, vertical: spacingSmall),
                      child: Row(children: [
                        SizedBox(
                          height: kImageHeight,
                          width: kImageHeight,
                          child: Image.network(
                            context
                                .read<BillingBloc>()
                                .selectedProducts[index]
                                .product
                                .variants[0]
                                .images[0],
                          ),
                        ),
                        const SizedBox(width: spacingLarge),
                        Expanded(
                            child: BillingProductTileBody(
                          selectedProduct: context
                              .read<BillingBloc>()
                              .selectedProducts[index],
                          posData: posData,
                        ))
                      ]));
                })));
  }
}
