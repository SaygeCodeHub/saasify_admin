import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_event.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/purchase_order/purchase_order_textfield.dart';
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
    int itemCount = 0;
    context.read<PurchaseOrderBloc>().add(LoadPurchaseOrder());
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
                  child: Column(
                    children: [
                      const CustomPageHeader(
                          titleText: "Purchase Order",
                          buttonVisible: false,
                          buttonTitle: StringConstants.kAddProduct,
                          utilityVisible: true,
                          textFieldVisible: false),
                      const SizedBox(height: spacingStandard),
                      BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
                        builder: (context, state) {
                          if (state is PurchaseOrderLoaded) {
                            return Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 160,
                                        vertical: spacingLarge),
                                    child: Card(
                                        elevation: 2,
                                        child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Padding(
                                              padding: const EdgeInsets.all(26),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    PurchaseOrderTextField(
                                                      hintText: StringConstants
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
                                                    const SizedBox(
                                                        height: spacingSmall),
                                                    Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  PurchaseOrderTextField(
                                                                    hintText:
                                                                        StringConstants
                                                                            .kVendorAddress,
                                                                    hintStyle: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .xTiniest
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                    onTextFieldChanged:
                                                                        (value) {},
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          spacingXSmall),
                                                                  PurchaseOrderTextField(
                                                                      hintText:
                                                                          StringConstants
                                                                              .kYourVendorsCompany,
                                                                      hintStyle: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .xTiniest
                                                                          .copyWith(
                                                                              color: AppColor
                                                                                  .saasifyDarkerGrey),
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
                                                                                  .saasifyDarkerGrey),
                                                                      onTextFieldChanged:
                                                                          (value) {}),
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
                                                                                  .saasifyDarkerGrey),
                                                                      onTextFieldChanged:
                                                                          (value) {})
                                                                ]),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      PurchaseOrderTextField(
                                                                          hintText: StringConstants
                                                                              .kPO,
                                                                          hintStyle: Theme.of(context)
                                                                              .textTheme
                                                                              .xTiniest
                                                                              .copyWith(fontWeight: FontWeight.w500),
                                                                          onTextFieldChanged: (value) {}),
                                                                      PurchaseOrderTextField(
                                                                          hintText: StringConstants
                                                                              .kPO12,
                                                                          hintStyle: Theme.of(context)
                                                                              .textTheme
                                                                              .xTiniest
                                                                              .copyWith(color: AppColor.saasifyDarkGrey),
                                                                          onTextFieldChanged: (value) {}),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      PurchaseOrderTextField(
                                                                          hintText: StringConstants
                                                                              .kOrderDate,
                                                                          hintStyle: Theme.of(context)
                                                                              .textTheme
                                                                              .xTiniest
                                                                              .copyWith(fontWeight: FontWeight.w500),
                                                                          onTextFieldChanged: (value) {}),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          CalendarDatePicker(
                                                                              initialDate: DateTime.now(),
                                                                              firstDate: DateTime(1950),
                                                                              lastDate: DateTime(2100),
                                                                              onDateChanged: (DateTime value) {
                                                                                value;
                                                                              });
                                                                        },
                                                                        child: PurchaseOrderTextField(
                                                                            readOnly:
                                                                                true,
                                                                            hintText:
                                                                                ' Dec 08, 2023',
                                                                            hintStyle:
                                                                                Theme.of(context).textTheme.xTiniest.copyWith(color: AppColor.saasifyDarkGrey),
                                                                            onTextFieldChanged: (value) {}),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        PurchaseOrderTextField(
                                                                            hintText:
                                                                                StringConstants.kDeliveryDate,
                                                                            hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(fontWeight: FontWeight.w500),
                                                                            onTextFieldChanged: (value) {}),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            CalendarDatePicker(
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(1950),
                                                                                lastDate: DateTime(2100),
                                                                                onDateChanged: (DateTime value) {
                                                                                  value;
                                                                                });
                                                                          },
                                                                          child: PurchaseOrderTextField(
                                                                              readOnly: true,
                                                                              hintText: 'Dec 08, 2023',
                                                                              hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(color: AppColor.saasifyDarkGrey),
                                                                              onTextFieldChanged: (value) {}),
                                                                        )
                                                                      ]),
                                                                ]),
                                                          )
                                                        ]),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kItemDescription,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest,
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kQty,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest,
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kRate,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest,
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                        PurchaseOrderTextField(
                                                            hintText:
                                                                StringConstants
                                                                    .kAmount,
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest,
                                                            onTextFieldChanged:
                                                                (value) {}),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxHeight: 500),
                                                      child: ListView.separated(
                                                        shrinkWrap: true,
                                                        itemCount: itemCount,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Row(
                                                            children: [
                                                              PurchaseOrderTextField(
                                                                  hintText:
                                                                      'bhgvfcrdxesxdcf',
                                                                  hintStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest,
                                                                  onTextFieldChanged:
                                                                      (value) {}),
                                                              PurchaseOrderTextField(
                                                                  hintText: '5',
                                                                  hintStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest,
                                                                  onTextFieldChanged:
                                                                      (value) {}),
                                                              PurchaseOrderTextField(
                                                                  hintText:
                                                                      '20',
                                                                  hintStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest,
                                                                  onTextFieldChanged:
                                                                      (value) {}),
                                                              PurchaseOrderTextField(
                                                                  hintText:
                                                                      '250',
                                                                  hintStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest,
                                                                  onTextFieldChanged:
                                                                      (value) {}),
                                                            ],
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                const Divider(),
                                                      ),
                                                    ),
                                                    // DataTable(
                                                    //     columnSpacing: 200,
                                                    //     horizontalMargin: 0,
                                                    //     headingRowHeight: 50,
                                                    //     columns: [
                                                    //       DataColumn(
                                                    //           label: Text(
                                                    //               StringConstants
                                                    //                   .kItemDescription,
                                                    //               style: Theme.of(
                                                    //                       context)
                                                    //                   .textTheme
                                                    //                   .xTiniest)),
                                                    //       DataColumn(
                                                    //           label: Text(
                                                    //               StringConstants
                                                    //                   .kQty,
                                                    //               style: Theme.of(
                                                    //                       context)
                                                    //                   .textTheme
                                                    //                   .xTiniest)),
                                                    //       DataColumn(
                                                    //           label: Text(
                                                    //               StringConstants
                                                    //                   .kRate,
                                                    //               style: Theme.of(
                                                    //                       context)
                                                    //                   .textTheme
                                                    //                   .xTiniest)),
                                                    //       DataColumn(
                                                    //           label: Text(
                                                    //               StringConstants
                                                    //                   .kAmount,
                                                    //               style: Theme.of(
                                                    //                       context)
                                                    //                   .textTheme
                                                    //                   .xTiniest)),
                                                    //     ],
                                                    //     rows: List.generate(
                                                    //         5,
                                                    //         (index) =>
                                                    //             DataRow(cells: [
                                                    //               DataCell(Text(
                                                    //                   'Cotton Shirt-S/Slim Fit',
                                                    //                   textAlign:
                                                    //                       TextAlign
                                                    //                           .center,
                                                    //                   style: Theme.of(
                                                    //                           context)
                                                    //                       .textTheme
                                                    //                       .xxTiniest)),
                                                    //               DataCell(Text('2',
                                                    //                   style: Theme.of(
                                                    //                           context)
                                                    //                       .textTheme
                                                    //                       .xxTiniest)),
                                                    //               DataCell(Text(
                                                    //                   '100.00',
                                                    //                   style: Theme.of(
                                                    //                           context)
                                                    //                       .textTheme
                                                    //                       .xxTiniest)),
                                                    //               DataCell(Text(
                                                    //                   '200.00',
                                                    //                   textAlign:
                                                    //                       TextAlign
                                                    //                           .center,
                                                    //                   style: Theme.of(
                                                    //                           context)
                                                    //                       .textTheme
                                                    //                       .xxTiniest)),
                                                    //             ]))),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              itemCount++;
                                                              context
                                                                  .read<
                                                                      PurchaseOrderBloc>()
                                                                  .add(
                                                                      LoadPurchaseOrder());
                                                            },
                                                            child: const Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .add_circle,
                                                                    color: AppColor
                                                                        .saasifyGreen),
                                                                Text(
                                                                    "Add Line Item"),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(children: [
                                                            Row(children: [
                                                              Text("Sub Total",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest),
                                                              Text("200.00",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                            ]),
                                                            const SizedBox(
                                                                height: 16),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Purchase Tax(10%)",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .xTiniest),
                                                                Text("20.00",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .xTiniest
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w600))
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 16),
                                                            Container(
                                                                color: AppColor
                                                                    .saasifyGrey,
                                                                height: 40,
                                                                width: 300,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            "Total",
                                                                            style:
                                                                                Theme.of(context).textTheme.xTiniest),
                                                                        Text(
                                                                            "220.00",
                                                                            style:
                                                                                Theme.of(context).textTheme.xTiniest.copyWith(fontWeight: FontWeight.w600))
                                                                      ]),
                                                                )),
                                                          ]),
                                                        ]),
                                                    const SizedBox(height: 10),
                                                    PurchaseOrderTextField(
                                                      hintText: 'Notes',
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .xTiniest,
                                                      onTextFieldChanged:
                                                          (value) {},
                                                    ),
                                                    const SizedBox(height: 10),
                                                    PurchaseOrderTextField(
                                                        width: 400,
                                                        hintText:
                                                            'It was great doing business with you.',
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .xTiniest,
                                                        onTextFieldChanged:
                                                            (value) {}),
                                                    const SizedBox(height: 20),
                                                    PurchaseOrderTextField(
                                                        hintText:
                                                            'Terms & Conditions',
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .xTiniest,
                                                        onTextFieldChanged:
                                                            (value) {}),
                                                    const SizedBox(height: 10),
                                                    PurchaseOrderTextField(
                                                        width: 700,
                                                        hintText:
                                                            'Upon accepting this purchase order, you hereby agree to the terms & conditions.',
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .xTiniest,
                                                        onTextFieldChanged:
                                                            (value) {}),
                                                  ]),
                                            )))));
                          }
                          return const SizedBox();
                        },
                      )
                    ],
                  ))
            ]));
  }
}
