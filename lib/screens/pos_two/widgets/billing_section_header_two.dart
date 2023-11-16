import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_spacing.dart';

class BillingSectionHeaderTwo extends StatelessWidget {
  const BillingSectionHeaderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Membership No:',
                style: Theme.of(context)
                    .textTheme
                    .xxTiniest
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: spacingXXSmall,
              ),
              Text(
                '8888881800',
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
                size: 16,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Customer Name:',
                style: Theme.of(context)
                    .textTheme
                    .xxTiniest
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: spacingXXSmall,
              ),
              Text(
                'Aditya Rastogi',
                style: Theme.of(context)
                    .textTheme
                    .xxTiniest
                    .copyWith(color: AppColor.saasifyGreyBlue),
              ),
            ],
          ),
          // const SizedBox(height: 16,),
          const Divider(
            color: AppColor.saasifyGreyBlue,
          )
        ],
      ),
    );
  }
}
