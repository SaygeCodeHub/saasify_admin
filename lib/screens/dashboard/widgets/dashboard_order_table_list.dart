import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';
import '../../../utils/constants/string_constants.dart';

class DashboardOrderTableList extends StatelessWidget {
  final List<OrdersData> ordersData;

  const DashboardOrderTableList({
    super.key,
    required this.ordersData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      DataTable(
          columnSpacing: 0,
          horizontalMargin: 10,
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
              (index) => DataRow(cells: [
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(ordersData[index].orderNumber.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.xxTiniest),
                    )),
                    DataCell(Text(ordersData[index].customerName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.xxTiniest)),
                    DataCell(Text(ordersData[index].modeOfPayment,
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
                            vertical: spacingXSmall,
                            horizontal: spacingXXSmall),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kCardRadius),
                            color: AppColor.saasifyLighterGreen),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.circle,
                                size: spacingXXSmall,
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
                                        .substring(1)
                                        .toLowerCase()
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(color: AppColor.saasifyGreen)),
                          ],
                        ))),
                  ])))
    ]);
  }
}
