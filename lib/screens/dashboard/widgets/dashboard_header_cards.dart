import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';

class DashboardHeaderCards extends StatelessWidget {
  const DashboardHeaderCards({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    List cardItems = [
      {
        'leading': "assets/card_image_one.PNG",
        'title': 'Total Order',
        'subtitle': ordersData.totalOrders,
      },
      {
        'leading': "assets/card_image_two.PNG",
        'title': 'Unpaid Orders',
        'subtitle': ordersData.unpaidOrder.count,
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Total Earning',
        'subtitle': ordersData.totalEarning,
      },
    ];
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 3,
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
                        blurRadius: 5.0,
                      )
                    ],
                    color: AppColor.saasifyWhite,
                  ),
                  child: Center(
                      child: ListTile(
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          tileColor: AppColor.saasifyWhite,
                          leading: (cardItems[index]['leading'] == null)
                              ? null
                              : Image.asset(
                                  cardItems[index]['leading'].toString()),
                          title: Padding(
                              padding: const EdgeInsets.only(
                                  left: spacingXSmall, top: spacingStandard),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cardItems[index]['title'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .xTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                      textScaleFactor:
                                          context.responsive(0.63, desktop: 1),
                                    ),
                                    const SizedBox(height: spacingSmall),
                                    Text(
                                        cardItems[index]['subtitle'].toString(),
                                        textScaleFactor: context
                                            .responsive(0.63, desktop: 1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .xTiny
                                            .copyWith(
                                                fontWeight: FontWeight.w600))
                                  ]))))));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4,
            crossAxisSpacing: spacingXHuge));
  }
}
