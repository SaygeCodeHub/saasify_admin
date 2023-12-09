import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/purchase_order/purchase_order_textfield.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_table.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';

class PurchaseOrder extends StatelessWidget {
  static const String routeName = 'PurchaseOrder';

  static List selectedIds = [];

  PurchaseOrder({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<InventoryBloc>().add(FetchInventoryList());
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 160, vertical: spacingLarge),
                    child: Expanded(
                      flex: 6,
                      child: SizedBox(
                          height: 900,
                          width: 500,
                          child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(26),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  PurchaseOrderTextField(
                                                    hintText: StringConstants
                                                        .kYourCompany,
                                                    hintStyle: Theme.of(context)
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
                                                      hintText: StringConstants
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
                                                      hintText: StringConstants
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
                                                        StringConstants.kCity,
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .xTiniest
                                                        .copyWith(
                                                            color: AppColor
                                                                .saasifyDarkGrey),
                                                    onTextFieldChanged:
                                                        (value) {},
                                                  ),
                                                  PurchaseOrderTextField(
                                                      hintText: StringConstants
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
                                                ]),
                                            // const SizedBox(width: 20),
                                            Text(StringConstants.kPurchaseOrder,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiny),
                                          ]),
                                      const SizedBox(height: spacingSmall),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(children: [
                                              PurchaseOrderTextField(
                                                hintText: StringConstants
                                                    .kVendorAddress,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .xTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                onTextFieldChanged: (value) {},
                                              ),
                                              const SizedBox(
                                                  height: spacingXSmall),
                                              PurchaseOrderTextField(
                                                  hintText: StringConstants
                                                      .kYourVendorsCompany,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .xTiniest
                                                      .copyWith(
                                                          color: AppColor
                                                              .saasifyDarkerGrey),
                                                  onTextFieldChanged:
                                                      (value) {}),
                                              PurchaseOrderTextField(
                                                  hintText:
                                                      StringConstants.kCity,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .xTiniest
                                                      .copyWith(
                                                          color: AppColor
                                                              .saasifyDarkerGrey),
                                                  onTextFieldChanged:
                                                      (value) {}),
                                              PurchaseOrderTextField(
                                                  hintText:
                                                      StringConstants.kCountry,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .xTiniest
                                                      .copyWith(
                                                          color: AppColor
                                                              .saasifyDarkerGrey),
                                                  onTextFieldChanged:
                                                      (value) {})
                                            ]),
                                            const SizedBox(width: spacingLarge),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              StringConstants
                                                                  .kPO,
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              StringConstants
                                                                  .kPO12,
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
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              StringConstants
                                                                  .kOrderDate,
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              ' Dec 08, 2023',
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
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              StringConstants
                                                                  .kDeliveryDate,
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          onTextFieldChanged:
                                                              (value) {}),
                                                      PurchaseOrderTextField(
                                                          hintText:
                                                              'Dec 08, 2023',
                                                          hintStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyDarkGrey),
                                                          onTextFieldChanged:
                                                              (value) {})
                                                    ],
                                                  ),
                                                ])
                                          ]),
                                      const SizedBox(height: 10),
                                      CustomDataTable(
                                          showRowCheckBox: false,
                                          checkboxVisible: false,
                                          columnList: const [
                                            StringConstants.kItemDescription,
                                            StringConstants.kQty,
                                            StringConstants.kRate,
                                            StringConstants.kAmount,
                                          ],
                                          selectedIds: const [
                                            StringConstants.kItemDescription,
                                            StringConstants.kQty,
                                            StringConstants.kRate,
                                            StringConstants.kAmount,
                                          ],
                                          dataCount: 3,
                                          dataIds: const [
                                            StringConstants.kItemDescription,
                                            StringConstants.kQty,
                                            StringConstants.kRate,
                                            StringConstants.kAmount,
                                          ],
                                          onHeaderCheckboxChange: () {},
                                          onRowCheckboxChange: (index) {},
                                          generateData: (index) {
                                            return [
                                              DataCell(Text(
                                                  'Cotton Shirt-S/Slim Fit',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xxTiniest)),
                                              DataCell(Text('2',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xxTiniest)),
                                              DataCell(Text('100.00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xxTiniest)),
                                              DataCell(Text('200.00',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xxTiniest)),
                                            ];
                                          }),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(Icons.add_circle,
                                                    color:
                                                        AppColor.saasifyGreen),
                                                Text("Add Line Item"),
                                              ],
                                            ),
                                            Column(children: [
                                              Row(
                                                children: [
                                                  Text("Sub Total",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xTiniest),
                                                  Text("200.00",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xTiniest
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("Purchase Tax(10%)",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xTiniest),
                                                  Text("20.00",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xTiniest
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                ],
                                              ),
                                              Container(
                                                  color: AppColor.saasifyGrey,
                                                  height: 30,
                                                  width: 300,
                                                  child: Row(children: [
                                                    Text("Total",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xTiniest),
                                                    Column(children: [
                                                      Container(
                                                        color: AppColor
                                                            .saasifyWhite,
                                                        height: 30,
                                                        width: 50,
                                                        child: const Text(""),
                                                      ),
                                                      Text("220.00",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))
                                                    ])
                                                  ]))
                                            ])
                                          ])
                                    ]),
                              ))),
                    ),
                  ))
            ]));
  }
}
