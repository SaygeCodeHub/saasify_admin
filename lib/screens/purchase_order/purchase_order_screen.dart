import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/purchase_order/purchase_order_textfield.dart';
import 'package:saasify/screens/purchase_order/widgets/purchase_order_date_section.dart';
import 'package:saasify/screens/purchase_order/widgets/purchase_order_notes_section.dart';
import 'package:saasify/screens/purchase_order/widgets/purchase_order_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';

import '../../widgets/custom_page_header.dart';

class PurchaseOrder extends StatelessWidget {
  static const String routeName = 'PurchaseOrder';

  PurchaseOrder({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 6),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kPurchaseOrderSmall),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 6),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(spacingLarge),
                    child: Column(
                      children: [
                        const CustomPageHeader(
                            titleText: StringConstants.kPurchaseOrderSmall,
                            buttonVisible: false,
                            buttonTitle: StringConstants.kAddProduct,
                            utilityVisible: true,
                            textFieldVisible: false),
                        const SizedBox(height: spacingStandard),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 180, vertical: spacingLarge),
                                child: Card(
                                    elevation: 4,
                                    child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(26),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        PurchaseOrderTextField(
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .tiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyDarkGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                          hintText:
                                                              StringConstants
                                                                  .kYourCompany,
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .tiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyDarkGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                          onTextFieldChanged:
                                                              (value) {},
                                                        ),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kYourName,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyDarkGrey),
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kCompanyAddress,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyDarkGrey),
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                        PurchaseOrderTextField(
                                                          hintText:
                                                              StringConstants
                                                                  .kCity,
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyDarkGrey),
                                                          onTextFieldChanged:
                                                              (value) {},
                                                        ),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kCountry,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyDarkGrey),
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                      ],
                                                    ),
                                                    Text(
                                                        StringConstants
                                                            .kPurchaseOrder,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xxTiny
                                                            .copyWith(
                                                                color: AppColor
                                                                    .saasifyGrey))
                                                  ],
                                                ),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                const PurchaseOrderDateSection(),
                                                const SizedBox(height: 10),
                                                const PurchaseOrderTable(),
                                                const SizedBox(height: 10),
                                                const PurchaseOrderNotesSection(),
                                              ]),
                                        ))))),
                      ],
                    ),
                  ))
            ]));
  }
}
