import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/screens/pos/widgets/variant_dialogue.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../configs/app_color.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productsByCategories,
  });

  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: productsByCategories[
                    context.read<BillingBloc>().selectedCategoryIndex]
                .products
                .length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (context.read<BillingBloc>().selectedProducts.isNotEmpty)
                        ? 5
                        : 7,
                childAspectRatio: 182 / 186),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(spacingStandard),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => VariantDialogue(
                                product: productsByCategories[context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex]
                                    .products[index],
                                productsByCategories: productsByCategories));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(spacingXXSmall),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kGeneralRadius),
                            color: AppColor.saasifyLightWhite,
                          ),
                          child: Column(children: [
                            const Row(),
                            Expanded(
                              child: Image.network(
                                productsByCategories[context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex]
                                    .products[index]
                                    .variants[0]
                                    .images[0],
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const SizedBox(height: spacingStandard),
                            SizedBox(
                                height: 40,
                                child: Center(
                                    child: Text(
                                        productsByCategories[context
                                                .read<BillingBloc>()
                                                .selectedCategoryIndex]
                                            .products[index]
                                            .productName,
                                        textAlign: TextAlign.center,
                                        style:
                                            Theme.of(context).textTheme.tiniest,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2))),
                            const SizedBox(height: spacingStandard),
                            Text(
                                '₹${productsByCategories[context.read<BillingBloc>().selectedCategoryIndex].products[index].variants[0].cost.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(
                                        color: AppColor.saasifyLightDeepBlue))
                          ]))));
            }));
  }
}
