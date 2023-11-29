import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class BillDetails extends StatelessWidget {
  final BillModel billDetails;

  const BillDetails({super.key, required this.billDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.saasifyWhite,
            borderRadius: BorderRadius.circular(kCircularRadius)),
        child: Padding(
            padding: const EdgeInsets.only(
                left: spacingStandard,
                right: spacingStandard,
                top: spacingStandard,
                bottom: spacingStandard),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.kSubTotal,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.saasifyDarkestBlack)),
                  const SizedBox(
                    height: spacingStandard,
                  ),
                  Text('₹ ${billDetails.itemTotal.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                ],
              ),
              const SizedBox(
                height: spacingSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.kDiscountCent,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.saasifyDarkestBlack)),
                  Text('₹ ${billDetails.discount.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                ],
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: SizedBox(
                                width: kDialogueWidth,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                                height: spacingXXSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingSmall),
                                            Text(
                                                StringConstants.kEnterGSTAmount,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xTiniest),
                                            const SizedBox(
                                                height: spacingXXSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingXMedium),
                                            Row(children: [
                                              Expanded(
                                                  child: SecondaryButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      buttonTitle:
                                                          StringConstants
                                                              .kCancel)),
                                              const SizedBox(
                                                  width: spacingXXSmall),
                                              Expanded(
                                                  child: PrimaryButton(
                                                      onPressed: () {},
                                                      buttonTitle:
                                                          StringConstants.kOk))
                                            ])
                                          ])
                                    ]))));
                    // context.read<BillingBloc>().customer.billDetails.additionalDiscount;
                  },
                  child: const Text('Add Discount')),
              const SizedBox(
                height: spacingStandard,
              ),
              const Divider(
                color: AppColor.saasifyPaleWhite,
                thickness: 0.5,
              ),
              const SizedBox(
                height: spacingXXSmall,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(StringConstants.kGrandTotal,
                    style: Theme.of(context).textTheme.xTiniest.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.saasifyDarkestBlack)),
                Text('₹ ${billDetails.total.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ])
            ])));
  }
}
