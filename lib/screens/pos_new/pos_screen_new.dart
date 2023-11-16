import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import 'variant_dialogue.dart';

class PosScreenNew extends StatelessWidget {
  const PosScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 6,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: spacingLarger,
                    bottom: spacingHuge,
                    right: spacingLarger,
                    left: spacingXXLarge),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: kDropdownWidthTwo,
                            height: kDropdownHeight,
                            child: CustomDropdownWidget(
                                color: AppColor.saasifyCementGrey,
                                dropdownValue: "Hot Dishes",
                                listItems: [
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
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiniest
                                  .copyWith(color: AppColor.saasifyRed)),
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
                      const SizedBox(height: kGeneralButtonHeight),
                      GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  childAspectRatio: 162 / 186),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(spacingXSmall),
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const VariantDialogue());
                                    },
                                    child: Container(
                                        height: 200,
                                        padding:
                                            const EdgeInsets.all(spacingXSmall),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              spacingXMedium),
                                          color: AppColor.saasifyLighterGrey,
                                        ),
                                        child: Column(children: [
                                          const Row(),
                                          SizedBox(
                                            height: kLogoWidth,
                                            child: Image.asset(
                                              'assets/cake_img.png',
                                            ),
                                          ),
                                          const SizedBox(
                                              height: spacingXMedium),
                                          Center(
                                              child: Text("Cake",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xxTiniest,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2)),
                                          const SizedBox(
                                              height: spacingXXSmall),
                                          Text('₹425',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .tiniest
                                                  .copyWith(
                                                      color: AppColor
                                                          .saasifyLightDeepBlue))
                                        ]))));
                          }),
                    ]))),
        const Expanded(
          flex: 4,
          child: SizedBox(),
        )
      ]))
    ]));
  }
}
