import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';

class ProductListDataTable extends StatelessWidget {
  final List<Product> productList;

  const ProductListDataTable({Key? key, required this.productList})
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
              label: Expanded(
                child: Center(
                  child: InkWell(
                      onTap: () {
                        if (ProductListScreen.selectedIds.length <
                            productList.length) {
                          ProductListScreen.selectedIds =
                              productList.map((e) => e.variantId).toList();
                        } else {
                          ProductListScreen.selectedIds.clear();
                        }
                        context
                            .read<ProductBloc>()
                            .add(ProductSelected(productList: productList));
                      },
                      child: Icon(
                          (ProductListScreen.selectedIds.isEmpty)
                              ? Icons.check_box_outline_blank
                              : (ProductListScreen.selectedIds.length <
                                      productList.length)
                                  ? Icons.indeterminate_check_box_outlined
                                  : Icons.check_box,
                          color: (ProductListScreen.selectedIds.isNotEmpty)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightDeepBlue)),
                ),
              ),
            ),
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
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            (ProductListScreen.selectedIds
                                    .contains(productList[index].variantId))
                                ? ProductListScreen.selectedIds
                                    .remove(productList[index].variantId)
                                : ProductListScreen.selectedIds
                                    .add(productList[index].variantId);
                            context
                                .read<ProductBloc>()
                                .add(ProductSelected(productList: productList));
                          },
                          child: Icon(
                              (ProductListScreen.selectedIds
                                      .contains(productList[index].variantId))
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank_rounded,
                              color: (ProductListScreen.selectedIds
                                      .contains(productList[index].variantId))
                                  ? AppColor.saasifyLightDeepBlue
                                  : AppColor.saasifyLightDeepBlue)),
                    )),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(productList[index].productName,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(productList[index].productId.toString(),
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
                    DataCell(IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AddProductScreen.routeName,
                              arguments: AddProductScreenArguments(
                                  isEdit: true,
                                  isVariant: false,
                                  dataMap: productList[index].toJson()));
                        },
                        icon: const Icon(Icons.edit)))
                  ])))
    ]));
  }
}
