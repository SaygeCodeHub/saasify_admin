import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../bloc/pos/billing_event.dart';
import '../../../configs/app_color.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.productsByCategories,
  });

  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productsByCategories.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                (context.read<BillingBloc>().selectedProducts.isNotEmpty)
                    ? 5
                    : 7,
            childAspectRatio: 160 / 58),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(spacingXXSmall),
              child: InkWell(
                  onTap: () {
                    context.read<BillingBloc>().selectedCategoryIndex = index;
                    context.read<BillingBloc>().add(SelectCategory(
                        productsByCategories: productsByCategories));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (index ==
                                context
                                    .read<BillingBloc>()
                                    .selectedCategoryIndex)
                            ? AppColor.saasifyLightDeepBlue
                            : AppColor.saasifyLightWhite,
                      ),
                      child: Center(
                          child: Text(productsByCategories[index].categoryName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (index ==
                                        context
                                            .read<BillingBloc>()
                                            .selectedCategoryIndex)
                                    ? AppColor.saasifyWhite
                                    : AppColor.saasifyBlack,
                              ))))));
        });
  }
}
