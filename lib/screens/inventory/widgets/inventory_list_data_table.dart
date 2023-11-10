import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_spacing.dart';

class InventoryListDataTable extends StatelessWidget {
  const InventoryListDataTable({Key? key}) : super(key: key);

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
              10,
              (index) => DataRow(cells: [
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text("maggie",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text("5",
                            style: Theme.of(context).textTheme.xxTiniest),
                      ),
                    ),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text("grocery",
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text("82",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text("62",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text("14",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    const DataCell(Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.edit,
                          size: spacingStandard,
                          color: AppColor.saasifyLightBlack,
                        ))),
                  ])))
    ]));
  }
}
