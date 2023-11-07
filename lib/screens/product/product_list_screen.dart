import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';

import '../../configs/app_color.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = 'ProductListScreen';

  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      const Expanded(child: SideBar(selectedIndex: 1)),
      Expanded(
          flex: 5,
          child: Padding(
              padding: const EdgeInsets.all(spacingLarge),
              child: Column(children: [
                Row(children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        hintText: 'Search here....',
                        onTextFieldChanged: (value) {}),
                  ),
                  const Spacer(),
                  Expanded(
                      child: PrimaryButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AddProductScreen.routeName);
                          },
                          buttonTitle: 'Add Product'))
                ]),
                const SizedBox(height: spacingStandard),
                Expanded(
                  child: ListView(children: <Widget>[
                    DataTable(
                        columnSpacing: 0,
                        horizontalMargin: 30,
                        showCheckboxColumn: true,
                        headingRowHeight: 50,
                        dataRowMaxHeight: 50,
                        columns: [
                          DataColumn(
                              label: Text('Created by',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(fontWeight: FontWeight.w500))),
                          DataColumn(
                              label: Text('Status',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(fontWeight: FontWeight.w500))),
                          DataColumn(
                              label: Text('Key',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(fontWeight: FontWeight.w500))),
                          DataColumn(
                              label: Text('English',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(fontWeight: FontWeight.w500))),
                          DataColumn(
                              label: Text('Hindi',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(fontWeight: FontWeight.w500))),
                        ],
                        rows: List<DataRow>.generate(
                            10,
                            (index) => DataRow(cells: [
                                  DataCell(Text('Data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w600))),
                                  DataCell(Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColor.saasifyGreen),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.circle,
                                              size: 8,
                                              color: AppColor.saasifyGreen),
                                          const SizedBox(width: 6),
                                          Text('Data',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor
                                                          .saasifyGreen)),
                                        ],
                                      ))),
                                  DataCell(Text('Data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColor
                                                  .saasifyLighterGrey))),
                                  DataCell(Text('Data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColor
                                                  .saasifyLighterGrey))),
                                  DataCell(Text('Data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColor
                                                  .saasifyLighterGrey))),
                                ])))
                  ]),
                )
              ])))
    ]));
  }
}
