import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import 'order_details_screen.dart';

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
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kOrderNo,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
            )),
            DataColumn(
                label: Text(StringConstants.kOrderedOn,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600))),
            DataColumn(
                label: Text(StringConstants.kCustomerContact,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600))),
            DataColumn(
                label: Text(StringConstants.kCustomerName,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600))),
            DataColumn(
                label: Text(StringConstants.kModeOfPayment,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600))),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(StringConstants.kProductAmount,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
            )),
            DataColumn(
                label: Text(StringConstants.kPaymentStatus,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600)))
          ],
          rows: List.generate(
              ordersData.length,
              (index) => DataRow(
                      onLongPress: () {
                        Navigator.pushReplacementNamed(
                            context, OrderDetailsScreen.routeName);
                      },
                      cells: [
                        DataCell(Align(
                          alignment: Alignment.center,
                          child: Text(ordersData[index].orderId.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.xxTiniest),
                        )),
                        DataCell(
                          Text(ordersData[index].orderedOn.toString(),
                              style: Theme.of(context).textTheme.xxTiniest),
                        ),
                        DataCell(Text(
                            ordersData[index].customerContact.toString(),
                            style: Theme.of(context).textTheme.xxTiniest)),
                        DataCell(Text(ordersData[index].customerName.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.xxTiniest)),
                        DataCell(Text(
                            ordersData[index].modeOfPayment.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.xxTiniest)),
                        DataCell(Align(
                          alignment: Alignment.center,
                          child: Text(ordersData[index].totalAmount.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.xxTiniest),
                        )),
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
                                Text(
                                    ordersData[index]
                                            .paymentStatus
                                            .trim()
                                            .substring(0, 1)
                                            .toUpperCase()
                                            .toString() +
                                        ordersData[index]
                                            .paymentStatus
                                            .trim()
                                            .substring(
                                              1,
                                            )
                                            .toLowerCase()
                                            .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTiniest
                                        .copyWith(
                                            color: AppColor.saasifyGreen)),
                              ],
                            ))),
                      ])))
    ]));
  }
}
