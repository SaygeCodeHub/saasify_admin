import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../../configs/app_spacing.dart';

class InventoryListDataTable extends StatelessWidget {
  final List<ProductWithVariant> productList;

  const InventoryListDataTable({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(children: <Widget>[
      DataTable(
          columnSpacing: 0,
          horizontalMargin: 20,
          showCheckboxColumn: true,
          headingRowHeight: 50,
          dataRowMaxHeight: 50,
          columns: [
            DataColumn(
                label: Text(StringConstants.kName,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kProductId,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500)),
              ),
            )),
            DataColumn(
                label: Text(StringConstants.kCategory,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kPrice,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500)),
              ),
            )),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kDiscountPercent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500)),
              ),
            )),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kStock,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500)),
              ),
            )),
            DataColumn(
                label: Expanded(
                    child: Center(
                        child: Text('',
                            style: Theme.of(context)
                                .textTheme
                                .xxTiniest
                                .copyWith(fontWeight: FontWeight.w500)))))
          ],
          rows: List.generate(
              productList.length,
              (index) => DataRow(cells: [
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(productList[index].productName,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(productList[index].barcode.toString(),
                            style: Theme.of(context).textTheme.xxTiniest),
                      ),
                    ),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(productList[index].categoryName,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(productList[index].cost.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(productList[index].discountPercent.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(productList[index].stock.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Map productDetailsMap = productList[index].toJson();
                            int addedStock = 0;
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      content: Column(
                                        children: [
                                          CustomTextField(
                                              onTextFieldChanged: (value) {
                                            addedStock = int.parse(value);
                                          }),
                                          PrimaryButton(
                                              onPressed: () {
                                                productDetailsMap['stock'] +=
                                                    addedStock;
                                                context
                                                    .read<InventoryBloc>()
                                                    .add(UpdateStock(
                                                        productDetailsMap:
                                                            productDetailsMap));
                                              },
                                              buttonTitle: 'Update')
                                        ],
                                      ),
                                    ));
                          },
                          icon: const Icon(
                            Icons.add,
                            size: spacingStandard,
                            color: AppColor.saasifyLightBlack,
                          ),
                        ))),
                  ])))
    ]));
  }
}
