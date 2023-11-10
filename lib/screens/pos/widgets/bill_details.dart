import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bill Details', style: Theme.of(context).textTheme.tiniest),
        const SizedBox(height: spacingXXSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Item Total',
                style: Theme.of(context)
                    .textTheme
                    .xxTiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
            Text('₹ 1500',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
          ],
        ),
        const Divider(color: AppColor.saasifyLighterGrey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
            Text('₹ 852',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Additional Charges',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
            Text('₹ 252',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLighterGrey)),
          ],
        ),
        const Divider(color: AppColor.saasifyLighterGrey),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('To Pay'),
            Text('₹ 1104'),
          ],
        ),
      ],
    );
  }
}
