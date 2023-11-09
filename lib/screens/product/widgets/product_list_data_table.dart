import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
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
                        if (ProductListScreen.selectedCheckboxes
                            .contains(false)) {
                          ProductListScreen.selectedCheckboxes = List.generate(
                              productList.length, (index) => true);
                        } else {
                          ProductListScreen.selectedCheckboxes;
                          ProductListScreen.selectedCheckboxes = List.generate(
                              productList.length, (index) => false);
                        }
                        context
                            .read<ProductBloc>()
                            .add(ProductSelected(productList: productList));
                      },
                      child: Icon(
                          (ProductListScreen.selectedCheckboxes
                                      .contains(true) &&
                                  ProductListScreen.selectedCheckboxes
                                      .contains(false))
                              ? Icons.indeterminate_check_box_outlined
                              : (ProductListScreen.selectedCheckboxes
                                      .contains(true))
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                          color: (ProductListScreen.selectedCheckboxes
                                  .contains(true))
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
                            ProductListScreen.selectedCheckboxes[index] =
                                !ProductListScreen.selectedCheckboxes[index];
                            context
                                .read<ProductBloc>()
                                .add(ProductSelected(productList: productList));
                          },
                          child: Icon(
                              ProductListScreen.selectedCheckboxes[index]
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank_rounded,
                              color: ProductListScreen.selectedCheckboxes[index]
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
                      child: Text(productList[index].variantCost.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(productList[index].discountedCost.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(productList[index].stock.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(
                      PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AddProductScreen.routeName);
                                  },
                                  child: const Text(StringConstants.kEdit)),
                              const PopupMenuItem(
                                  child: Text(StringConstants.kDelete))
                            ];
                          },
                          child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.more_vert))),
                    )
                  ])))
    ]));
  }
}
