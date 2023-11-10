import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos/widgets/product_grid.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/billing/fetch_products_by_category_model.dart';
import 'category_grid.dart';

class ProductsWithCategories extends StatelessWidget {
  final List<CategoryWithProductsDatum> productsByCategories;

  const ProductsWithCategories({
    super.key,
    required this.productsByCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingXXLarge, vertical: spacingXXLarge),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacingStandard),
              child: Row(children: [
                SizedBox(
                    width: context.responsive(0,
                        widescreen: 1000, desktop: 720, tablets: 550),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search,
                                color: AppColor.saasifyLightDeepBlue, size: 27),
                            hintText: 'Search here...'))),
                const SizedBox(width: spacingStandard),
                Container(
                    padding: const EdgeInsets.all(spacingXMedium),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(spacingXMedium)),
                    child: Row(children: [
                      SvgPicture.asset('assets/exchange.svg'),
                      const SizedBox(width: spacingXXSmall),
                      Text(
                        'Filter',
                        style: Theme.of(context)
                            .textTheme
                            .xxTiniest
                            .copyWith(color: AppColor.saasifyRed),
                      )
                    ]))
              ])),
          const SizedBox(height: spacingStandard),
          CategoryGrid(productsByCategories: productsByCategories),
          const SizedBox(height: spacingStandard),
          ProductGrid(productsByCategories: productsByCategories),
        ]));
  }
}
