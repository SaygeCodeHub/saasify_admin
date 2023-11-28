import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/dashboard_card_util.dart';

class DashboardHeaderCards extends StatelessWidget {
  const DashboardHeaderCards({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    List cardItems = [
      {'subtitle': ordersData.totalOrders},
      {'subtitle': ordersData.unpaidOrder.count},
      {'subtitle': ordersData.totalEarning},
      {'subtitle': 'Manage Profile'},
      {'subtitle': 'Manage Branches'},
      {'subtitle': 'Manage Payment Methods'},
      {'subtitle': 'Manage Employees'},
      {'subtitle': 'Manage Coupons'}
    ];

    return GridView.builder(
        shrinkWrap: true,
        itemCount: cardItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(right: spacingStandard),
              child: Container(
                  height: spacingStandard,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kCircularRadius),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColor.saasifyLightPaleGrey,
                            blurRadius: 5.0)
                      ],
                      color: AppColor.saasifyWhite),
                  child: Center(
                      child: ListTile(
                          onTap: () {
                            (dashboardCard[index].routeName == '')
                                ? null
                                : Navigator.pushReplacementNamed(
                                    context, dashboardCard[index].routeName);
                          },
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          tileColor: AppColor.saasifyWhite,
                          leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.saasifyPaleGrey),
                              child: Icon(dashboardCard[index].iconName)),
                          title: Padding(
                              padding: const EdgeInsets.only(
                                  left: spacingXSmall, top: spacingStandard),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dashboardCard[index].title.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                        textScaleFactor: context
                                            .responsive(0.63, desktop: 1)),
                                    const SizedBox(height: spacingXSmall),
                                    Text(
                                        cardItems[index]['subtitle'].toString(),
                                        textScaleFactor: context
                                            .responsive(0.63, desktop: 1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .xxTiniest
                                            .copyWith(
                                                fontWeight: FontWeight.w500))
                                  ]))))));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3.5,
            crossAxisSpacing: spacingXHuge,
            mainAxisSpacing: spacingStandard));
  }
}
