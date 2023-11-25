import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';

class DashboardHeaderCards extends StatelessWidget {
  DashboardHeaderCards({super.key, required this.ordersData});

  final OrdersData ordersData;

  final List cardItems = [
    {
      // 'leading': null,
      'leading': "assets/card_image_one.PNG",
      'title': 'Total Earning',
      'subtitle': '5851',
      'trailing': null,
    },
    {
      'leading': "assets/card_image_two.PNG",
      // 'leading': null,
      'title': 'Total Order',
      'subtitle': '2',
      'trailing': null,
    },
    {
      // 'leading': "assets/card_image_three.PNG",
      'leading': null,
      'title': 'Unpaid Orders',
      'subtitle': '1',
      'trailing': 0.1
    },
    {'leading': null, 'title': 'Cash', 'subtitle': '22', 'trailing': 0.12},
    {'leading': null, 'title': 'UPI', 'subtitle': '55', 'trailing': 0.15},
    {'leading': null, 'title': 'Bank Card', 'subtitle': '76', 'trailing': 0.5},
    {'leading': null, 'title': 'Other', 'subtitle': '80', 'trailing': 0.10},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
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
                        : Image.asset(cardItems[index]['leading'].toString()),
                    title: Text(
                      cardItems[index]['title'].toString(),
                      style: Theme.of(context).textTheme.xxTiniest,
                      textScaleFactor: context.responsive(0.63, desktop: 1),
                    ),
                    subtitle: Text(cardItems[index]['subtitle'].toString(),
                        textScaleFactor: context.responsive(0.63, desktop: 1),
                        style: Theme.of(context)
                            .textTheme
                            .xTiny
                            .copyWith(fontWeight: FontWeight.w600)),
                    trailing: (cardItems[index]['trailing'] == null)
                        ? null
                        : CircularPercentIndicator(
                            radius:
                                context.responsive(22, desktop: spacingXLarge),
                            lineWidth: spacingXSmall,
                            animation: true,
                            percent: cardItems[index]['trailing'],
                            center:
                                Text(cardItems[index]['trailing'].toString()),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: AppColor.saasifyLightDeepBlue)),
              )),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 50 / 29,
          crossAxisSpacing: spacingSmall),
    );
  }
}
