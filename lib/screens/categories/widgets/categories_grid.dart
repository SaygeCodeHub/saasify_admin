import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import '../../../widgets/custom_alert_box.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../categories_screen.dart';
import 'category_toggle_widget.dart';

class CategoriesGrid extends StatelessWidget {
  final List<ProductCategory> productCategory;

  const CategoriesGrid({super.key, required this.productCategory});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: productCategory.length,
      itemBuilder: (BuildContext context, int index) {
        return Expanded(
            child: Container(
                height: spacingStandard,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                  ],
                  color: AppColor.saasifyWhite,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(kCircularRadius),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
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
                                color: AppColor.saasifyDarkGrey),
                          ),
                          Row(children: [
                            CategoryToggleWidget(
                                productCategory: productCategory[index]),
                            const SizedBox(width: spacingXSmall),
                            PopupMenuButton(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                content: SizedBox(
                                                    width: kDialogueWidth,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              StringConstants
                                                                  .kEditCategoryName,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .tiniest),
                                                          const SizedBox(
                                                              height:
                                                                  spacingXXSmall),
                                                          CustomTextField(
                                                              onTextFieldChanged:
                                                                  (value) {}),
                                                          const SizedBox(
                                                              height:
                                                                  spacingSmall),
                                                          PrimaryButton(
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        CategoriesBloc>()
                                                                    .add(EditCategories(
                                                                        categoryDetailsMap: {}));
                                                                Navigator.pop(
                                                                    ctx);
                                                              },
                                                              buttonTitle:
                                                                  StringConstants
                                                                      .kEdit)
                                                        ]))));
                                      },
                                      child: const Text(StringConstants.kEdit)),
                                  PopupMenuItem(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CustomAlertDialog(
                                                    title: StringConstants
                                                        .kWarning,
                                                    message: StringConstants
                                                        .kDeleteCategory,
                                                    primaryButtonTitle:
                                                        StringConstants
                                                            .kConfirm,
                                                    primaryOnPressed: () {
                                                      context
                                                          .read<
                                                              CategoriesBloc>()
                                                          .add(DeleteCategories(
                                                              categoryId:
                                                                  productCategory[
                                                                          index]
                                                                      .categoryId));
                                                      Navigator.pop(context);
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              CategoriesScreen
                                                                  .routeName);
                                                    },
                                                    secondaryButtonTitle:
                                                        StringConstants.kCancel,
                                                    secondaryOnPressed: () {
                                                      Navigator.pop(context);
                                                    }));
                                      },
                                      child:
                                          const Text(StringConstants.kDelete))
                                ];
                              },
                              child: const Icon(Icons.more_vert),
                            )
                          ])
                        ]))));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
