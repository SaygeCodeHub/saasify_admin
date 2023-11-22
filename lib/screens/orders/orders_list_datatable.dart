import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';

class OrdersListDataTable extends StatelessWidget {
  final List<OrdersData> ordersData;

  const OrdersListDataTable({Key? key, required this.ordersData})
      : super(key: key);

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
                label: Text(StringConstants.kOrderNo,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kOrderedOn,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kCustomerContact,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kCustomerName,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kModeOfPayment,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kProductAmount,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500))),
            DataColumn(
                label: Text(StringConstants.kStatus,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w500)))
          ],
          rows: List.generate(
              ordersData.length,
              (index) => DataRow(cells: [
                    DataCell(Text(ordersData[index].orderId.toString(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(
                      Text(ordersData[index].orderedOn.toString(),
                          style: Theme.of(context).textTheme.xxTiniest),
                    ),
                    DataCell(Text(ordersData[index].customerContact.toString(),
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(Text(ordersData[index].customerName.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(Text(ordersData[index].modeOfPayment.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(Text(ordersData[index].totalAmount.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.saasifyLighterGreen),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.circle,
                                size: 8, color: AppColor.saasifyGreen),
                            const SizedBox(width: 6),
                            Text(ordersData[index].paymentStatus.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(color: AppColor.saasifyGreen)),
                          ],
                        ))),
                  ])))
    ]));
  }
}
