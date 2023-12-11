import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/dashboard/widgets/dashboard_order_table_list.dart';
import 'package:saasify/utils/dashboard_card.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import 'dashboardCalendar.dart';
import 'dashboardChart.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 2,
          child: Column(children: [
            Expanded(
                child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kCircularRadius)),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: spacingMedium, right: spacingXLarge),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: spacingXSmall,
                                      horizontal: spacingStandard),
                                  child: Text('Order Count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              fontWeight: FontWeight.w600))),
                              const SizedBox(height: spacingStandard),
                              const Expanded(child: DashboardChart()),
                            ])))),
            const SizedBox(height: spacingStandard),
            Expanded(child: DashboardOrderTableList(ordersData: ordersData))
          ])),
      const SizedBox(width: spacingLarge),
      Expanded(
          child: Column(children: [
        Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: const Padding(
                padding: EdgeInsets.only(
                    left: spacingSmall,
                    right: spacingSmall,
                    bottom: spacingSmall),
                child: DashboardCalendar())),
        const SizedBox(height: spacingStandard),
        Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: spacingSmall, vertical: spacingLarge),
                child: ListView.separated(
                    itemCount: dashboardOptionList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: spacingLarge);
                    },
                    itemBuilder: (context, index) {
                      index = index;
                      return InkWell(
                          onTap: () {
                            (dashboardOptionList[index].routeName == '')
                                ? null
                                : Navigator.pushReplacementNamed(context,
                                    dashboardOptionList[index].routeName);
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacingStandard),
                              child: Center(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Container(
                                        height: kDashboardIconContainerSize,
                                        width: kDashboardIconContainerSize,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                kGeneralRadius),
                                            color: dashboardOptionList[index]
                                                .iconColor),
                                        child: Icon(
                                            dashboardOptionList[index].iconName,
                                            color: dashboardOptionList[index]
                                                .containerColor)),
                                    const SizedBox(width: spacingSmall),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                          Text(
                                              dashboardOptionList[index]
                                                  .title
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .tinier
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                              textScaleFactor:
                                                  context.responsive(0.63,
                                                      desktop: 1)),
                                          const SizedBox(height: spacingXSmall),
                                          Text(
                                              dashboardOptionList[index]
                                                  .subtitle
                                                  .toString(),
                                              textScaleFactor: context
                                                  .responsive(0.63, desktop: 1),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500))
                                        ]))
                                  ]))));
                    })))
      ]))
    ]);
  }
}
