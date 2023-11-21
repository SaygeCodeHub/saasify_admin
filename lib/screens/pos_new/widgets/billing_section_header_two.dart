import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_spacing.dart';

class BillingSectionHeader extends StatelessWidget {
  const BillingSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(
          StringConstants.kMembershipNO,
          style: Theme.of(context).textTheme.xTiniest.copyWith(
              fontWeight: FontWeight.w600, color: AppColor.saasifyDarkestBlack),
        ),
        const SizedBox(
          width: spacingXXSmall,
        ),
        Text(
          StringConstants.k8888881800,
          style: Theme.of(context)
              .textTheme
              .xTiniest
              .copyWith(color: AppColor.saasifyGreyBlue),
        ),
        const SizedBox(
          width: spacingXXSmall,
        ),
        const Icon(
          Icons.mode_edit_outlined,
          color: AppColor.saasifyLightDeepBlue,
          size: spacingMedium,
        )
      ]),
      const SizedBox(
        height: spacingSmall,
      ),
      Row(children: [
        Text(
          StringConstants.kCustomerName,
          style: Theme.of(context).textTheme.xTiniest.copyWith(
              fontWeight: FontWeight.w600, color: AppColor.saasifyDarkestBlack),
        ),
        const SizedBox(
          width: spacingXXSmall,
        ),
        Text(StringConstants.kAdityaRastogi,
            style: Theme.of(context).textTheme.xTiniest.copyWith(
                color: AppColor.saasifyGreyBlue,
                decoration: TextDecoration.underline))
      ]),
      const SizedBox(height: spacingStandard),
      const Divider(color: AppColor.saasifyPaleGrey, thickness: 1)
    ]);
  }
}
