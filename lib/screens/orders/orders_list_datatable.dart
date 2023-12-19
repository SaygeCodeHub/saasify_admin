import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/orders/orders_bloc.dart';
import 'package:saasify/bloc/orders/orders_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/orders/orders_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_table.dart';
import '../../configs/app_spacing.dart';
import 'order_details_screen.dart';

class OrdersListDataTable extends StatelessWidget {
  final OrdersData orderListDatum;

  const OrdersListDataTable({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columnList: const [
          StringConstants.kOrderNo,
          StringConstants.kOrderedDate,
          StringConstants.kCustomerContact,
          StringConstants.kCustomerName,
          StringConstants.kModeOfPayment,
          StringConstants.kProductAmount,
          StringConstants.kPaymentStatus
        ],
        selectedIds: OrdersScreen.selectedIds,
        dataCount: orderListDatum.orders.length,
        dataIds: orderListDatum.orders.map((e) => e.orderId).toList(),
        onHeaderCheckboxChange: () {
          if (OrdersScreen.selectedIds.length < orderListDatum.orders.length) {
            OrdersScreen.selectedIds =
                orderListDatum.orders.map((e) => e.orderId).toList();
          } else {
            OrdersScreen.selectedIds.clear();
          }
          context.read<OrdersBloc>().add(SelectOrder(orders: orderListDatum));
        },
        onRowCheckboxChange: (index) {
          (OrdersScreen.selectedIds
                  .contains(orderListDatum.orders[index].orderId))
              ? OrdersScreen.selectedIds
                  .remove(orderListDatum.orders[index].orderId)
              : OrdersScreen.selectedIds
                  .add(orderListDatum.orders[index].orderId);
          context.read<OrdersBloc>().add(SelectOrder(orders: orderListDatum));
        },
        generateData: (index) {
          return [
            DataCell(
                Text(orderListDatum.orders[index].orderId.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Text(
                    DateFormat('dd MMM yyyy')
                        .format(orderListDatum.orders[index].orderDate),
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Text(orderListDatum.orders[index].customerContact.toString(),
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Text(orderListDatum.orders[index].customerName.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Text(orderListDatum.orders[index].paymentType.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Text(
                    '${orderListDatum.orders[index].currency} ${orderListDatum.orders[index].totalAmount.toString()}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            }),
            DataCell(
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: spacingXSmall, horizontal: spacingXXSmall),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kCardRadius),
                        color: (orderListDatum.orders[index].paymentStatus
                                        .trim()
                                        .substring(0, 1)
                                        .toUpperCase()
                                        .toString() +
                                    orderListDatum.orders[index].paymentStatus
                                        .trim()
                                        .substring(1)
                                        .toLowerCase()
                                        .toString() ==
                                'Paid')
                            ? AppColor.saasifyLighterGreen
                            : AppColor.saasifyLighterRed),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.circle,
                          size: spacingXXSmall,
                          color: (orderListDatum.orders[index].paymentStatus
                                          .trim()
                                          .substring(0, 1)
                                          .toUpperCase()
                                          .toString() +
                                      orderListDatum.orders[index].paymentStatus
                                          .trim()
                                          .substring(1)
                                          .toLowerCase()
                                          .toString() ==
                                  'Paid')
                              ? AppColor.saasifyGreen
                              : AppColor.saasifyRed),
                      const SizedBox(width: spacingXXSmall),
                      Text(
                          orderListDatum.orders[index].paymentStatus
                                  .trim()
                                  .substring(0, 1)
                                  .toUpperCase()
                                  .toString() +
                              orderListDatum.orders[index].paymentStatus
                                  .trim()
                                  .substring(1)
                                  .toLowerCase()
                                  .toString(),
                          style: Theme.of(context).textTheme.xxTiniest.copyWith(
                              color: (orderListDatum.orders[index].paymentStatus
                                              .trim()
                                              .substring(0, 1)
                                              .toUpperCase()
                                              .toString() +
                                          orderListDatum
                                              .orders[index].paymentStatus
                                              .trim()
                                              .substring(1)
                                              .toLowerCase()
                                              .toString() ==
                                      'Paid')
                                  ? AppColor.saasifyGreen
                                  : AppColor.saasifyRed))
                    ])), onTap: () {
              Navigator.pushReplacementNamed(
                  context, OrderDetailsScreen.routeName,
                  arguments: orderListDatum.orders[index]);
            })
          ];
        });
  }
}
