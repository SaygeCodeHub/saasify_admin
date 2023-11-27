import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/categories/categories_bloc.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

class CategoriesPopUpMenuWidget extends StatelessWidget {
  final ProductCategory productCategory;

  const CategoriesPopUpMenuWidget({super.key, required this.productCategory});

  @override
  Widget build(BuildContext context) {
    Map editCategoryMap = productCategory.toJson();

    return PopupMenuButton(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(StringConstants.kEditCategoryName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tiniest),
                                    const SizedBox(height: spacingXXSmall),
                                    CustomTextField(
                                        initialValue:
                                            productCategory.categoryName,
                                        onTextFieldChanged: (value) {
                                          editCategoryMap['category_name'] =
                                              value;
                                        }),
                                    const SizedBox(height: spacingSmall),
                                    PrimaryButton(
                                        onPressed: () {
                                          context.read<CategoriesBloc>().add(
                                              EditCategories(
                                                  categoryDetailsMap:
                                                      editCategoryMap));
                                          Navigator.pop(ctx);
                                        },
                                        buttonTitle: StringConstants.kEdit)
                                  ]))));
                },
                child: const Text(StringConstants.kEdit)),
            PopupMenuItem(
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => CustomAlertDialog(
                  //         title: StringConstants.kWarning,
                  //         message: StringConstants.kDeleteCategory,
                  //         primaryButtonTitle: StringConstants.kConfirm,
                  //         primaryOnPressed: () {
                  //           context.read<CategoriesBloc>().add(DeleteCategories(
                  //               categoryId: productCategory.categoryId));
                  //           Navigator.pop(context);
                  //         },
                  //         secondaryButtonTitle: StringConstants.kCancel,
                  //         secondaryOnPressed: () {
                  //           Navigator.pop(context);
                  //         }));
                },
                child: const Text(StringConstants.kDelete))
          ];
        },
        child: const Icon(Icons.more_vert));
  }
}
