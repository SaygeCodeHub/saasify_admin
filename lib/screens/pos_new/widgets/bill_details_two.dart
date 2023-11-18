import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillDetailsTwo extends StatelessWidget {
  const BillDetailsTwo({super.key});

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
                  Text('₹ ${context.read<BillingBloc>().billDetails.itemTotal}',
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
                  Text(StringConstants.k0,
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
                Text('₹ ${context.read<BillingBloc>().billDetails.total}',
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(color: AppColor.saasifyGreyBlue))
              ])
            ])));
  }
}
