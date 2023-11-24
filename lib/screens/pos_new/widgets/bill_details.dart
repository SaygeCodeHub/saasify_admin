import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';

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
