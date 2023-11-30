import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/dashboard/widgets/dashboard_order_table_list.dart';
import '../../../configs/app_spacing.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(flex: 2, child: DashboardOrderTableList(ordersData: ordersData)),
      const SizedBox(width: spacingLarge),
      Expanded(
          child: SingleChildScrollView(
              child: Column(children: [
        Padding(
            padding: const EdgeInsets.only(
                right: spacingXXSmall, left: spacingSmall),
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kCircularRadius)),
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    onDateChanged: (DateTime value) {})))
      ])))
    ]);
  }
}
