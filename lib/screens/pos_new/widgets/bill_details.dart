import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';

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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ]),
              const SizedBox(
                height: spacingSmall,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Text(StringConstants.kDiscount,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.saasifyDarkestBlack)),
                  const SizedBox(width: spacingXSmall),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: spacingXSmall,
                              horizontal: spacingXSmall),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.saasifyBlack)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.saasifyBlack)),
                        ),
                        onFieldSubmitted: (value) {
                          context
                              .read<BillingBloc>()
                              .customer
                              .billDetails
                              .additionalDiscount = double.parse(value);
                          context.read<BillingBloc>().add(AddDiscount(
                              productsByCategories: productsByCategories));
                        },
                        style: Theme.of(context).textTheme.xTiniest,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],
                        onChanged: (value) {}),
                  )
                ]),
                Text('$currency ${billDetails.discount.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ]),
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
