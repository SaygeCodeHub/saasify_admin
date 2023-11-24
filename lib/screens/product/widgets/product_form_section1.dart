import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';

class ProductFormSection1 extends StatelessWidget {
  const ProductFormSection1({
    super.key,
    required this.isVariant,
    required this.isEdit,
    required this.dataMap,
    required this.categoryList,
  });

  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(StringConstants.kCategory,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      CustomDropdownWidget(
          validator: (value) {
            if (value == null || value.trim() == '') {
              return 'Please Select a Category';
            }
            return null;
          },
          addOption: true,
          hintText: 'Add New Category',
          canEdit: !(isVariant && !isEdit),
          dataMap: dataMap,
          mapKey: 'category_name',
          initialValue: dataMap['category_name'] ??
                  (categoryList.map((e) => e.categoryName).toList().isNotEmpty)
              ? categoryList.map((e) => e.categoryName).toList()[0]
              : 'Add New',
          listItems:
              categoryList.map((e) => e.categoryName).toList() + ['Add New']),
      const SizedBox(height: spacingHuge),
      Wrap(children: [
        Text(StringConstants.kProductDescription,
            style: Theme.of(context)
                .textTheme
                .xxTiniest
                .copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(width: spacingXSmall),
        Text(StringConstants.kMaxLines,
            style: Theme.of(context).textTheme.xTiniest)
      ]),
      const SizedBox(height: spacingXMedium),
      CustomTextField(
          maxLines: 3,
          validator: (value) {
            if ((value == null || value.trim() == '') &&
                dataMap['draft'] == false) {
              return 'Please Enter the Product Description';
            }
            return null;
          },
          enabled: !(isVariant && !isEdit),
          initialValue: dataMap['product_description'] ?? '',
          onTextFieldChanged: (value) {
            dataMap['product_description'] = value;
          }),
    ]));
  }
}
