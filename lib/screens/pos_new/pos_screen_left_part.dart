import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos_new/product_grid.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class POSScreenLeftPart extends StatelessWidget {
  const POSScreenLeftPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: spacingLarger,
            bottom: spacingHuge,
            right: spacingLarger,
            left: spacingXXLarge),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const SizedBox(
                width: kDropdownWidthTwo,
                height: kDropdownHeight,
                child: CustomDropdownWidget(
                    color: AppColor.saasifyCementGrey,
                    initialValue: "Hot Dishes",
                    listItems: [
                      "Hot Dishes",
                      "Cold Dishes",
                      "soup",
                      "Grill",
                      "Appetizer",
                      "Dessert"
                    ]),
              ),
              const SizedBox(width: kGeneralButtonHeight),
              Expanded(
                child: CustomTextField(
                    hintText: StringConstants.kSearchProduct,
                    onTextFieldChanged: (value) {}),
              ),
              const SizedBox(height: spacingLarger),
            ],
          ),
          const SizedBox(height: spacingLarger),
          Row(
            children: [
              Text(StringConstants.kHotDishes,
                  style: Theme.of(context).textTheme.xxTiniest.copyWith(
                      color: AppColor.saasifyRed,
                      decoration: TextDecoration.underline)),
              const SizedBox(width: spacingHuge),
              Text(StringConstants.kColdDishes,
                  style: Theme.of(context).textTheme.xxTiniest),
              const SizedBox(width: spacingHuge),
              Text(StringConstants.kSoup,
                  style: Theme.of(context).textTheme.xxTiniest),
              const SizedBox(width: spacingHuge),
              Text(StringConstants.kGrill,
                  style: Theme.of(context).textTheme.xxTiniest),
              const SizedBox(width: spacingHuge),
              Text(StringConstants.kAppetizer,
                  style: Theme.of(context).textTheme.xxTiniest),
              const SizedBox(width: spacingHuge),
            ],
          ),
          const Divider(),
          const SizedBox(height: kGeneralButtonHeight),
          const ProductGrid()
        ]));
  }
}
