import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../bloc/categories/categories_bloc.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';

class AddCategoryPopUp extends StatelessWidget {
  AddCategoryPopUp({super.key});

  static Map addCategoryMap = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: kGeneralActionButtonWidth,
        child: PrimaryButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      content: SizedBox(
                          width: kDialogueWidth,
                          child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(StringConstants.kAddNewCategory,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xTiniest
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700)),
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.close,
                                                    color:
                                                        AppColor.saasifyGrey)))
                                      ]),
                                  const SizedBox(height: spacingMedium),
                                  Text(StringConstants.kCategoryName,
                                      style:
                                          Theme.of(context).textTheme.xTiniest),
                                  const SizedBox(height: spacingXXSmall),
                                  CustomTextField(validator: (value) {
                                    if (value == null || value.trim() == '') {
                                      return StringConstants
                                          .kPleaseEnterTheCategoryName;
                                    }
                                    return null;
                                  }, onTextFieldChanged: (value) {
                                    addCategoryMap['category_name'] = value;
                                  }),
                                  const SizedBox(height: spacingXMedium),
                                  Row(children: [
                                    Expanded(
                                        child: SecondaryButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            buttonTitle:
                                                StringConstants.kCancel)),
                                    const SizedBox(width: spacingXXSmall),
                                    Expanded(
                                        child: PrimaryButton(
                                            onPressed: () {
                                              addCategoryMap["is_active"] =
                                                  true;
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<CategoriesBloc>()
                                                    .add(SaveCategories(
                                                        categoriesDetailsMap:
                                                            addCategoryMap));
                                                Navigator.pop(context);
                                              }
                                            },
                                            buttonTitle: StringConstants.kOk))
                                  ])
                                ]),
                          ))));
            },
            buttonTitle: StringConstants.kAddCategory));
  }
}
