import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'bill_details_two.dart';
import 'billing_products_list_two.dart';
import 'billing_section_footer_two.dart';
import 'billing_section_header_two.dart';

class BillingSectionTwo extends StatelessWidget {
  const BillingSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColor.saasifyGreyBluee,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingLarger, vertical: kVerticalPadding),
            child: Column(children: [
              const BillingSectionHeaderTwo(),
              const SizedBox(height: spacingXXSmall),
              const BillingProductsListTwo(),
              const SizedBox(height: spacingSmall),
              const BillDetailsTwo(),
              const SizedBox(
                height: spacingMedium,
              ),
              Expanded(
                  child: CustomTextField(
                      fillColor: AppColor.saasifyDarkGrey,
                      onTextFieldChanged: (value) {},
                      hintText: StringConstants.kEnterCoupon,
                      contentPadding: const EdgeInsets.all(spacingStandard),
                      suffix: Text(
                        StringConstants.kApplyCODE,
                        style: Theme.of(context).textTheme.xTiniest.copyWith(
                            color: AppColor.saasifyLightDeepBlue,
                            fontWeight: FontWeight.w800),
                      ))),
              const Expanded(child: BillingSectionFooterTwo())
            ])));
  }
}
