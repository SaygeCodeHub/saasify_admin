import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/discount/widgets/employees_grid.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/secondary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class DiscountScreen extends StatelessWidget {
  static const String routeName = 'DiscountScreen';

  DiscountScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kDiscounts),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(children: [
                        Row(children: [
                          context.responsive(const SizedBox(),
                              desktop: Text(StringConstants.kDiscounts,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiny
                                      .copyWith(fontWeight: FontWeight.w700))),
                          context.responsive(const SizedBox(),
                              desktop: const Spacer()),
                          const Spacer(),
                          SizedBox(
                              width: kGeneralActionButtonWidth,
                              child: PrimaryButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            content: SizedBox(
                                                width: kDialogueWidth,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              StringConstants
                                                                  .kAddDiscount,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  const Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Icon(
                                                                    Icons.close,
                                                                    color: AppColor
                                                                        .saasifyGrey),
                                                              )),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height:
                                                              spacingMedium),
                                                      Text(
                                                          StringConstants
                                                              .kDiscountCoupon,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                      const SizedBox(
                                                          height:
                                                              spacingXXSmall),
                                                      CustomTextField(
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      const SizedBox(
                                                          height: spacingSmall),
                                                      Text(
                                                          StringConstants
                                                              .kEnterDiscountPercent,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                      const SizedBox(
                                                          height:
                                                              spacingXXSmall),
                                                      CustomTextField(
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      const SizedBox(
                                                          height: spacingSmall),
                                                      Text(
                                                          StringConstants
                                                              .kMinimumPurchaseValue,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                      const SizedBox(
                                                          height:
                                                              spacingXXSmall),
                                                      CustomTextField(
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      const SizedBox(
                                                          height: spacingSmall),
                                                      Text(
                                                          StringConstants
                                                              .kMaximumPurchaseValue,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                      const SizedBox(
                                                          height:
                                                              spacingXXSmall),
                                                      CustomTextField(
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      Row(children: [
                                                        Text(
                                                            StringConstants
                                                                .kDoYouWantToDeactivateDiscount,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest),
                                                        Switch(
                                                            activeColor: AppColor
                                                                .saasifyLightDeepBlue,
                                                            value: true,
                                                            onChanged: (value) {
                                                              // Map productDetails = productList[index].toJson();
                                                              // productDetails['variant_active'] = value;
                                                              // context.read<ProductBloc>().add(
                                                              //     EditProduct(productDetailsMap: productDetails));
                                                            })
                                                      ]),
                                                      const SizedBox(
                                                          height:
                                                              spacingXMedium),
                                                      Row(children: [
                                                        Expanded(
                                                            child:
                                                                SecondaryButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    buttonTitle:
                                                                        StringConstants
                                                                            .kCancel)),
                                                        const SizedBox(
                                                            width:
                                                                spacingXXSmall),
                                                        Expanded(
                                                            child: PrimaryButton(
                                                                onPressed:
                                                                    () {},
                                                                buttonTitle:
                                                                    StringConstants
                                                                        .kOk))
                                                      ])
                                                    ]))));
                                  },
                                  buttonTitle: StringConstants.kAddDiscount))
                        ]),
                        const SizedBox(height: spacingStandard),
                        const EmployeesGrid()
                      ])))
            ]));
  }
}
