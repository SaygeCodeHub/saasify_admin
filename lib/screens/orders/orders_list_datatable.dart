import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_spacing.dart';
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
                                .copyWith(fontWeight: FontWeight.w600))))),
            DataColumn(
                label: Text(StringConstants.kOrderedDate,
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
                                .copyWith(fontWeight: FontWeight.w600))))),
            DataColumn(
                label: Text(StringConstants.kPaymentStatus,
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600)))
          ],
          rows: List.generate(
              ordersData.length,
              (index) => DataRow(cells: [
                    DataCell(
                        Align(
                            alignment: Alignment.center,
                            child: Text(ordersData[index].orderId.toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.xxTiniest)),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Text(
                            DateFormat('dd MMM yyyy')
                                .format(ordersData[index].orderDate),
                            style: Theme.of(context).textTheme.xxTiniest),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Text(ordersData[index].customerContact.toString(),
                            style: Theme.of(context).textTheme.xxTiniest),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Text(ordersData[index].customerName.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.xxTiniest),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Text(ordersData[index].paymentType.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.xxTiniest),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                                ordersData[index].totalAmount.toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.xxTiniest)),
                        onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    }),
                    DataCell(
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: spacingXSmall,
                                horizontal: spacingXXSmall),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kGeneralRadius),
                                color: AppColor.saasifyLighterGreen),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              const Icon(Icons.circle,
                                  size: kPaymentCircleSize,
                                  color: AppColor.saasifyGreen),
                              const SizedBox(width: spacingXXSmall),
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
                                      .copyWith(color: AppColor.saasifyGreen))
                            ])), onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OrderDetailsScreen.routeName,
                          arguments: ordersData[index]);
                    })
                  ])))
    ]));
  }
}
