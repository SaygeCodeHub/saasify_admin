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
    required this.isProductDetail,
  });

  final bool isVariant;
  final bool isEdit;
  final bool isProductDetail;
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
      (isProductDetail == true)
          ? Text(dataMap['product_name'])
          : CustomTextField(
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
      (isProductDetail == true)
          ? Text(dataMap['barcode'].toString())
          : CustomTextField(
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
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kQuantity,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          (isProductDetail == true)
              ? Text(dataMap['quantity'].toString())
              : CustomTextField(
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
          Text(StringConstants.kUnit,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          (isProductDetail == true)
              ? Text(dataMap['unit'] ?? "nos")
              : CustomDropdownWidget(
                  initialValue: dataMap['unit'] ?? "nos",
                  listItems: ["nos", "kg", "l", "gm", "m"] +
                      ((dataMap['unit'] != null &&
                              !["nos", "kg", "l", "gm", "m"]
                                  .contains(dataMap['unit']))
                          ? [dataMap['unit']]
                          : []),
                  dataMap: dataMap,
                  mapKey: 'unit')
        ]))
      ]),
      const SizedBox(height: spacingXXLarge),
      Text(StringConstants.kGST,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      (isProductDetail == true)
          ? const Text("5%")
          : CustomDropdownWidget(
              initialValue: "Select GST",
              listItems: const ["Select GST", "0%", "5%", "12%", "18%", "28%"],
              dataMap: dataMap,
              mapKey: 'unit'),
      const SizedBox(height: spacingXXSmall),
      (isProductDetail == true)
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('CGST : 2.5 % and SGST : 2.5 %',
                  style: Theme.of(context).textTheme.xxxTiniest),
            ),
    ]));
  }
}
