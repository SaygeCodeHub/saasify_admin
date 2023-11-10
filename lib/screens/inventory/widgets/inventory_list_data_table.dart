import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/inventory/widgets/edit_inventory_stock_widget.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/inventory/inventory_list_model.dart';

class InventoryListDataTable extends StatelessWidget {
  final List<InventoryProductList> inventoryProductList;

  const InventoryListDataTable({Key? key, required this.inventoryProductList})
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
              inventoryProductList.length,
              (index) => DataRow(cells: [
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(inventoryProductList[index].productName,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                            inventoryProductList[index].productId.toString(),
                            style: Theme.of(context).textTheme.xxTiniest),
                      ),
                    ),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(inventoryProductList[index].categoryName,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(inventoryProductList[index].cost.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(inventoryProductList[index].cost.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(inventoryProductList[index].stock.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const EditInventoryStock());
                          },
                          child: const Icon(
                            Icons.edit,
                            size: spacingStandard,
                            color: AppColor.saasifyLightBlack,
                          ),
                        ))),
                  ])))
    ]));
  }
}
