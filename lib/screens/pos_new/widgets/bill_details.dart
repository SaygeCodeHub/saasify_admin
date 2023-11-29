import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class BillDetails extends StatelessWidget {
  final String currency;
  final BillModel billDetails;
  final List<CategoryWithProductsDatum> productsByCategories;

  const BillDetails(
      {super.key,
      required this.billDetails,
      required this.productsByCategories,
      required this.currency});

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
                  Text('$currency ${billDetails.itemTotal.toStringAsFixed(2)}',
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
                  Text(StringConstants.kDiscount,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.saasifyDarkestBlack)),
                  Text('$currency ${billDetails.discount.toStringAsFixed(2)}',
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
                  Row(
                    children: [
                      Text(StringConstants.kAdditionalDiscount,
                          style: Theme.of(context).textTheme.xTiniest.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColor.saasifyDarkestBlack)),
                      const SizedBox(width: spacingSmall),
                      IconButton(
                          style: IconButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: SizedBox(
                                          width: kDialogueWidth,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    StringConstants
                                                        .kEnterDiscountPercent,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xTiniest),
                                                const SizedBox(
                                                    height: spacingXXSmall),
                                                CustomTextField(
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    onTextFieldChanged:
                                                        (value) {
                                                      context
                                                              .read<BillingBloc>()
                                                              .customer
                                                              .billDetails
                                                              .additionalDiscount =
                                                          double.parse(value);
                                                    }),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                Row(children: [
                                                  Expanded(
                                                      child: SecondaryButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          buttonTitle:
                                                              StringConstants
                                                                  .kCancel)),
                                                  const SizedBox(
                                                      width: spacingXXSmall),
                                                  Expanded(
                                                      child: PrimaryButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    BillingBloc>()
                                                                .customer
                                                                .billDetails
                                                                .additionalDiscount;
                                                            context
                                                                .read<
                                                                    BillingBloc>()
                                                                .add(AddDiscount(
                                                                    productsByCategories:
                                                                        productsByCategories));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          buttonTitle:
                                                              StringConstants
                                                                  .kOk))
                                                ])
                                              ])));
                                });
                          },
                          icon: const Icon(Icons.edit_outlined, size: 14))
                    ],
                  ),
                  Text(
                      '$currency ${(context.read<BillingBloc>().customer.billDetails.total * (context.read<BillingBloc>().customer.billDetails.additionalDiscount / 100)).toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                ],
              ),
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
                Text('$currency ${billDetails.total.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ])
            ])));
  }
}
