import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillDetailsTwo extends StatelessWidget {
  final BillModel billDetails;

  const BillDetailsTwo({super.key, required this.billDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColor.saasifyWhite,
        ),
        child: Padding(
            padding: const EdgeInsets.only(
                left: spacingStandard,
                right: spacingStandard,
                top: spacingSmall,
                bottom: spacingSmall),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.kSubTotal,
                      style: Theme.of(context)
                          .textTheme
                          .xxTiniest
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: spacingStandard,
                  ),
                  Text('₹ ${billDetails.itemTotal.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .xxTiniest
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
                      style: Theme.of(context)
                          .textTheme
                          .xxTiniest
                          .copyWith(fontWeight: FontWeight.w600)),
                  Text('₹ ${billDetails.discount.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .xxTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                ],
              ),
              const Divider(color: AppColor.saasifyGreyBlue),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(StringConstants.kGrandTotal,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('₹ ${billDetails.total.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ])
            ])));
  }
}
