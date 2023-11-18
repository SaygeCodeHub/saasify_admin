import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_spacing.dart';

class BillingSectionHeaderTwo extends StatelessWidget {
  const BillingSectionHeaderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(
          StringConstants.kMembershipNO,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: spacingXXSmall,
        ),
        Text(
          StringConstants.k8888881800,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(color: AppColor.saasifyGreyBlue),
        ),
        const SizedBox(
          width: spacingXXSmall,
        ),
        const Icon(
          Icons.mode_edit_outlined,
          color: AppColor.saasifyLightDeepBlue,
          size: spacingStandard,
        )
      ]),
      Row(children: [
        Text(StringConstants.kCustomerName,
            style: Theme.of(context)
                .textTheme
                .xxTiniest
                .copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(
          width: spacingXXSmall,
        ),
        Text(StringConstants.kAdityaRastogi,
            style: Theme.of(context)
                .textTheme
                .xxTiniest
                .copyWith(color: AppColor.saasifyGreyBlue))
      ]),
      const Divider(
        color: AppColor.saasifyGreyBlue,
      )
    ]);
  }
}
