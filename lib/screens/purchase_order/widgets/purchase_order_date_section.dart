import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../utils/constants/string_constants.dart';
import '../purchase_order_textfield.dart';

class PurchaseOrderDateSection extends StatelessWidget {
  const PurchaseOrderDateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              PurchaseOrderTextField(
                hintText: StringConstants.kVendorAddress,
                hintStyle: Theme.of(context)
                    .textTheme
                    .xTiniest
                    .copyWith(fontWeight: FontWeight.w600),
                onTextFieldChanged: (value) {},
              ),
              PurchaseOrderTextField(
                  hintText: StringConstants.kYourVendorsCompany,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .xTiniest
                      .copyWith(color: AppColor.saasifyDarkerGrey),
                  onTextFieldChanged: (value) {}),
              PurchaseOrderTextField(
                  hintText: StringConstants.kCity,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .xTiniest
                      .copyWith(color: AppColor.saasifyDarkerGrey),
                  onTextFieldChanged: (value) {}),
              PurchaseOrderTextField(
                  hintText: StringConstants.kCountry,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .xTiniest
                      .copyWith(color: AppColor.saasifyDarkerGrey),
                  onTextFieldChanged: (value) {})
            ]),
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PurchaseOrderTextField(
                          width: 150,
                          hintText: StringConstants.kPO,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w500),
                          onTextFieldChanged: (value) {}),
                      PurchaseOrderTextField(
                          width: 150,
                          hintText: StringConstants.kPO12,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(color: AppColor.saasifyDarkGrey),
                          onTextFieldChanged: (value) {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PurchaseOrderTextField(
                          width: 150,
                          hintText: StringConstants.kOrderDate,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w500),
                          onTextFieldChanged: (value) {}),
                      PurchaseOrderTextField(
                          width: 150,
                          hintText: ' Dec 08, 2023',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(color: AppColor.saasifyDarkGrey),
                          onTapFunction: () {
                            CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                                onDateChanged: (DateTime value) {
                                  value;
                                });
                          },
                          onTextFieldChanged: (value) {}),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    PurchaseOrderTextField(
                        width: 150,
                        hintText: StringConstants.kDeliveryDate,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .xTiniest
                            .copyWith(fontWeight: FontWeight.w500),
                        onTextFieldChanged: (value) {}),
                    PurchaseOrderTextField(
                        width: 150,
                        readOnly: true,
                        hintText: 'Dec 08, 2023',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .xTiniest
                            .copyWith(color: AppColor.saasifyDarkGrey),
                        onTapFunction: () {
                          CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100),
                              onDateChanged: (DateTime value) {
                                value;
                              });
                        },
                        onTextFieldChanged: (value) {})
                  ]),
                ]),
          )
        ]);
  }
}
