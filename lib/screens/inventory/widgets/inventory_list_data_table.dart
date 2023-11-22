import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../../configs/app_spacing.dart';

class InventoryListDataTable extends StatelessWidget {
  final List<InventoryProduct> productList;

  InventoryListDataTable({Key? key, required this.productList})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(shrinkWrap: true, children: <Widget>[
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
                child: Text(StringConstants.kBarcode,
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
            ))
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (productList[index].stock != 0)
                                    ? () {
                                        int removedStock = 0;
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                content: SizedBox(
                                                    width: kDialogueWidth,
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Form(
                                                            key: _formKey,
                                                            child:
                                                                CustomTextField(
                                                                    validator:
                                                                        (value) {
                                                                      if (removedStock >
                                                                          productList[index]
                                                                              .stock) {
                                                                        return 'Please enter a number less than current stock';
                                                                      } else if (removedStock == 0) {
                                                                        return 'Please enter a no. greater than 0';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    onTextFieldChanged:
                                                                        (value) {
                                                                      removedStock =
                                                                          int.parse(
                                                                              value);
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                              height:
                                                                  spacingSmall),
                                                          PrimaryButton(
                                                              onPressed: () {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  context
                                                                      .read<
                                                                          InventoryBloc>()
                                                                      .add(UpdateStock(
                                                                          updateStockMap: {
                                                                            "stock_id":
                                                                                productList[index].stockId,
                                                                            "stock":
                                                                                removedStock,
                                                                            "variant_id":
                                                                                productList[index].variantId,
                                                                            "increment":
                                                                                false
                                                                          }));
                                                                  Navigator.pop(
                                                                      ctx);
                                                                }
                                                              },
                                                              buttonTitle:
                                                                  'Update')
                                                        ]))));
                                      }
                                    : null,
                                child: Container(
                                  height: kCounterContainerSize,
                                  width: kCounterContainerSize,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.saasifyLightPaleGrey),
                                  ),
                                  child: Center(
                                      child: (productList[index].stock != 0)
                                          ? const Icon(
                                              Icons.remove,
                                              size: kGeneralRadius,
                                            )
                                          : const SizedBox.shrink())
                                )
                              ),
                              Container(
                                height: kCounterContainerSize,
                                width: kStockContainerSize,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.saasifyLightPaleGrey),
                                ),
                                child: Center(
                                    child: Text(
                                        productList[index].stock.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .xxTiniest
                                            .copyWith(
                                                color: (productList[index]
                                                            .stock ==
                                                        0)
                                                    ? AppColor.saasifyRed
                                                    : AppColor.saasifyBlack))),
                              ),
                              InkWell(
                                  onTap: () {
                                    int addedStock = 0;
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            content: SizedBox(
                                                width: kDialogueWidth,
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CustomTextField(
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          onTextFieldChanged:
                                                              (value) {
                                                            addedStock =
                                                                int.parse(
                                                                    value);
                                                          }),
                                                      const SizedBox(
                                                          height: spacingSmall),
                                                      PrimaryButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    InventoryBloc>()
                                                                .add(UpdateStock(
                                                                    updateStockMap: {
                                                                      "stock_id":
                                                                          productList[index]
                                                                              .stockId,
                                                                      "stock":
                                                                          addedStock,
                                                                      "variant_id":
                                                                          productList[index]
                                                                              .variantId,
                                                                      "increment":
                                                                          true
                                                                    }));
                                                            Navigator.pop(ctx);
                                                          },
                                                          buttonTitle: 'Update')
                                                    ]))));
                                  },
                                  child: Container(
                                      height: kCounterContainerSize,
                                      width: kCounterContainerSize,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColor.saasifyLightPaleGrey),
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        size: kGeneralRadius,
                                      ))))
                            ])))
                  ])))
    ]));
  }
}
