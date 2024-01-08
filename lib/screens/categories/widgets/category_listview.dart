import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/toggle_switch_widget.dart';
import '../../../bloc/categories/categories_bloc.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import 'categories_pop_up_menu_widget.dart';

class CategoryListview extends StatelessWidget {
  final List<ProductCategory> productCategory;

  const CategoryListview({super.key, required this.productCategory});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: productCategory.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: spacingXXHuge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCircularRadius),
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                ],
                color: AppColor.saasifyWhite),
            child: Padding(
                padding: const EdgeInsets.all(kCircularRadius),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: spacingXXSmall),
                        child: Text(
                            productCategory[index]
                                    .categoryName
                                    .trim()
                                    .substring(0, 1)
                                    .toUpperCase() +
                                productCategory[index]
                                    .categoryName
                                    .trim()
                                    .substring(
                                      1,
                                    )
                                    .toLowerCase(),
                            style: Theme.of(context).textTheme.tiniest.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.saasifyDarkGrey)),
                      ),
                      Row(children: [
                        ToggleSwitchWidget(
                            value: productCategory[index].isActive,
                            onChanged: (bool value) {
                              Map editCategoryMap =
                                  productCategory[index].toJson();
                              editCategoryMap['is_active'] = value;
                              context.read<CategoriesBloc>().add(EditCategories(
                                  categoryDetailsMap: editCategoryMap));
                            }),
                        SizedBox(
                            width: (productCategory[index].categoryName !=
                                    'uncategorized')
                                ? spacingXSmall
                                : spacingXXLarge),
                        Visibility(
                          visible: productCategory[index].categoryName !=
                              'uncategorized',
                          child: CategoriesPopUpMenuWidget(
                              productCategory: productCategory[index]),
                        )
                      ])
                    ])));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: spacingSmall);
      },
    );
  }
}
