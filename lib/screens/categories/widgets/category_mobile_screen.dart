import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import 'add_category_pop_up.dart';
import 'category_listview.dart';

class CategoryMobileScreen extends StatelessWidget {
  final List<ProductCategory> categoryList;

  const CategoryMobileScreen({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(StringConstants.kCategories,
            style: Theme.of(context)
                .textTheme
                .xTinier
                .copyWith(fontWeight: FontWeight.w700)),
        SizedBox(width: kDashContainerHeight, child: AddCategoryPopUp())
      ]),
      const SizedBox(height: spacingStandard),
      CategoryListview(productCategory: categoryList),
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
