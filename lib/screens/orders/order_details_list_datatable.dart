import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../utils/constants/string_constants.dart';

class OrderDetailsListDataTable extends StatelessWidget {
  const OrderDetailsListDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      DataTable(
          columnSpacing: 0,
          horizontalMargin: 20,
          showCheckboxColumn: true,
          headingRowHeight: 50,
          dataRowMaxHeight: 50,
          columns: [
            // DataColumn(
            //     label: Expanded(
            //         child: Center(
            //             child: Visibility(
            //                 visible: productList.isNotEmpty,
            //                 child: InkWell(
            //                     onTap: () {
            //                       if (ProductListScreen.selectedIds.length <
            //                           productList.length) {
            //                         ProductListScreen.selectedIds = productList
            //                             .map((e) => e.variantId)
            //                             .toList();
            //                       } else {
            //                         ProductListScreen.selectedIds.clear();
            //                       }
            //                       context.read<ProductBloc>().add(
            //                           ProductSelected(
            //                               productList: productList));
            //                     },
            //                     child: Icon(
            //                         (ProductListScreen.selectedIds.isEmpty)
            //                             ? Icons.check_box_outline_blank
            //                             : (ProductListScreen
            //                             .selectedIds.length <
            //                             productList.length)
            //                             ? Icons
            //                             .indeterminate_check_box_outlined
            //                             : Icons.check_box,
            //                         color: (ProductListScreen
            //                             .selectedIds.isNotEmpty)
            //                             ? AppColor.saasifyLightDeepBlue
            //                             : AppColor.saasifyLightDeepBlue)))))),
            DataColumn(
                label: Text(StringConstants.kName,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600))),
            DataColumn(
                label: Expanded(
                    child: Center(
              child: Text(StringConstants.kUnitPrice,
                  style: Theme.of(context)
                      .textTheme
                      .xTiniest
                      .copyWith(fontWeight: FontWeight.w600)),
            ))),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kQuantity,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
            ))
          ],
          rows: List.generate(
              4,
              (index) => DataRow(cells: [
                    // DataCell(Align(
                    //   alignment: Alignment.center,
                    //   child: InkWell(
                    //       onTap: () {
                    //         // (ProductListScreen.selectedIds
                    //         //     .contains(productList[index].variantId))
                    //         //     ? ProductListScreen.selectedIds
                    //         //     .remove(productList[index].variantId)
                    //         //     : ProductListScreen.selectedIds
                    //         //     .add(productList[index].variantId);
                    //         // context
                    //         //     .read<ProductBloc>()
                    //         //     .add(ProductSelected(productList: productList));
                    //       },
                    //       child: Icon(
                    //           (ProductListScreen.selectedIds
                    //               .contains(productList[index].variantId))
                    //               ? Icons.check_box
                    //               : Icons.check_box_outline_blank_rounded,
                    //           color: (ProductListScreen.selectedIds
                    //               .contains(productList[index].variantId))
                    //               ? AppColor.saasifyLightDeepBlue
                    //               : AppColor.saasifyLightDeepBlue)),
                    // )),
                    DataCell(Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Biscuits',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.xxTiniest))),
                    DataCell(Align(
                        alignment: Alignment.center,
                        child: Text('190',
                            style: Theme.of(context).textTheme.xxTiniest))),
                    DataCell(Align(
                        alignment: Alignment.center,
                        child: Text('58',
                            style: Theme.of(context).textTheme.xxTiniest)))
                  ])))
    ]);
  }
}
