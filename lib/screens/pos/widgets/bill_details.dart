import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({
    super.key,
    required this.billDetails,
  });

  final BillModel billDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bill Details', style: Theme.of(context).textTheme.tinier),
        const SizedBox(height: spacingXXSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Item Total',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
            Text('₹${billDetails.itemTotal.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
          ],
        ),
        const Divider(color: AppColor.saasifyGreyBlue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
            Text('₹${billDetails.gSTCharges.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Additional Charges',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
            Text('₹${billDetails.additionalCharges.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyGreyBlue)),
          ],
        ),
        const Divider(color: AppColor.saasifyGreyBlue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('To Pay'),
            Text('₹${billDetails.total.toStringAsFixed(2)}'),
          ],
        ),
      ],
    );
  }
}
