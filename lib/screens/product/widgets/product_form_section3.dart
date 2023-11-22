import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';

class ProductFormSection3 extends StatelessWidget {
  const ProductFormSection3({
    super.key,
    required this.isVariant,
    required this.isEdit,
    required this.dataMap,
  });

  final bool isVariant;
  final bool isEdit;
  final Map dataMap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(StringConstants.kBrand,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      CustomTextField(
          validator: (value) {
            if ((value == null || value.trim() == '') &&
                dataMap['draft'] == false) {
              return 'Please Enter the Brand Name';
            }
            return null;
          },
          enabled: !(isVariant && !isEdit),
          initialValue: dataMap['brand_name'] ?? '',
          onTextFieldChanged: (value) {
            dataMap['brand_name'] = value;
          }),
      const SizedBox(height: spacingHuge),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kPrice,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          CustomTextField(
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'This field cannot be blank';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: dataMap['cost'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['cost'] = value;
              })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kDiscountPercent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          CustomTextField(
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'This field cannot be blank';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: dataMap['discount_percent'] ?? '0',
              onTextFieldChanged: (value) {
                dataMap['discount_percent'] = value;
              })
        ]))
      ]),
      const SizedBox(height: spacingHuge),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kStock,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          CustomTextField(
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'This field cannot be blank';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: dataMap['stock'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['stock'] = value;
              })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kLowStock,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          CustomTextField(
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'This field cannot be blank';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: dataMap['restock_reminder'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['restock_reminder'] = value;
              })
        ]))
      ])
    ]));
  }
}
