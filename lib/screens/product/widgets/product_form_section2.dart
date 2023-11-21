import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';

class ProductFormSection2 extends StatelessWidget {
  const ProductFormSection2({
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
      Text(StringConstants.kName,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      CustomTextField(
          validator: (value) {
            if (value == null || value.trim() == '') {
              return 'Please Enter the Product Name';
            }
            return null;
          },
          enabled: !(isVariant && !isEdit),
          initialValue: dataMap['product_name'] ?? '',
          onTextFieldChanged: (value) {
            dataMap['product_name'] = value;
          }),
      const SizedBox(height: spacingHuge),
      Text(StringConstants.kBarcode,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      CustomTextField(
          validator: (value) {
            if (value == null || value.trim() == '') {
              return 'Please Enter the Product Barcode';
            }
            return null;
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          initialValue: dataMap['barcode'] ?? '',
          onTextFieldChanged: (value) {
            dataMap['barcode'] = value;
          }),
      const SizedBox(height: spacingHuge),
      Row(children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kQuantity,
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
              initialValue: dataMap['quantity'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['quantity'] = value;
              })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kMeasuringQuantity,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          CustomDropdownWidget(
              initialValue: dataMap['unit'] ?? "units",
              listItems: const ["units", "kg", "l", "gm", "m"],
              dataMap: dataMap,
              mapKey: 'unit')
        ]))
      ])
    ]));
  }
}
