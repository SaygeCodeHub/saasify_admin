import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import 'add_category_pop_up.dart';
import 'categories_grid.dart';

class CategoryWebScreen extends StatelessWidget {
  final List<ProductCategory> categoryList;

  const CategoryWebScreen({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        context.responsive(const SizedBox(),
            desktop: Text(StringConstants.kCategories,
                style: Theme.of(context)
                    .textTheme
                    .xxTiny
                    .copyWith(fontWeight: FontWeight.w700))),
        context.responsive(const SizedBox(), desktop: const Spacer()),
        const Spacer(),
        AddCategoryPopUp()
      ]),
      const SizedBox(height: spacingStandard),
      CategoriesGrid(productCategory: categoryList),
      Visibility(
          visible: categoryList.isEmpty,
          child: Center(
              child: Text(StringConstants.kNoDataAvailable,
                  style: Theme.of(context).textTheme.tinier.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.saasifyLightGrey)))),
      Visibility(visible: categoryList.isEmpty, child: const Spacer())
    ]);
  }
}
