import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

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
                    top: 23, bottom: 30, right: 23, left: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: CustomDropdownWidget(
                                dropdownValue: "Hot Dishes",
                                listItems: [
                                  "Cold Dishes",
                                  "soup",
                                  "Grill",
                                  "Appetizer",
                                  "Dessert"
                                ]),
                          ),
                          const SizedBox(width: 49),
                          Expanded(
                            child: CustomTextField(
                                hintText: StringConstants.kSearchProduct,
                                onTextFieldChanged: (value) {}),
                          ),
                          const SizedBox(height: 23),
                        ],
                      ),
                      const SizedBox(height: 23),
                      Row(
                        children: [
                          Text(StringConstants.kHotDishes,
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiniest
                                  .copyWith(color: AppColor.saasifyRed)),
                          const SizedBox(width: 32),
                          Text(StringConstants.kColdDishes,
                              style: Theme.of(context).textTheme.xxTiniest),
                          const SizedBox(width: 32),
                          Text(StringConstants.kSoup,
                              style: Theme.of(context).textTheme.xxTiniest),
                          const SizedBox(width: 32),
                          Text(StringConstants.kGrill,
                              style: Theme.of(context).textTheme.xxTiniest),
                          const SizedBox(width: 32),
                          Text(StringConstants.kAppetizer,
                              style: Theme.of(context).textTheme.xxTiniest),
                          const SizedBox(width: 32),
                        ],
                      ),
                      const SizedBox(height: 53),
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
                                    onTap: () {},
                                    child: Container(
                                        padding:
                                            const EdgeInsets.all(spacingXSmall),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              spacingXMedium),
                                          color: AppColor.saasifyLighterGrey,
                                        ),
                                        child: Column(children: [
                                          const Row(),
                                          Expanded(
                                            child: Image.asset(
                                              'assets/cake_img.png',
                                            ),
                                          ),
                                          const SizedBox(
                                              height: spacingXMedium),
                                          SizedBox(
                                              height: 20,
                                              child: Center(
                                                  child: Text("Cake",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xxTiniest,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2))),
                                          const SizedBox(
                                              height: spacingXMedium),
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
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Column(children: [
                  Row(
                    children: [
                      Text(StringConstants.kMembershipNO,
                          style: Theme.of(context).textTheme.xxTiniest),
                      const SizedBox(width: 20),
                      Text(StringConstants.k8888881800,
                          style: Theme.of(context).textTheme.xxTiniest.copyWith(
                              color: AppColor.saasifyLighterGrey,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(width: 40),
                      const Icon(
                        Icons.edit,
                        size: 12,
                        color: AppColor.saasifyLightDeepBlue,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    Text(StringConstants.kCustomerName,
                        style: Theme.of(context).textTheme.xxTiniest),
                    const SizedBox(width: 20),
                    Text(StringConstants.kAdityaRastogi,
                        style: Theme.of(context).textTheme.xxTiniest.copyWith(
                            color: AppColor.saasifyLighterGrey,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline)),
                    const SizedBox(width: 40),
                  ])
                ]),
                const Divider(),
              ]),
            ))
      ]))
    ]));
  }
}
