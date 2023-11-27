import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import '../../discount/discount_screen.dart';
import '../../settings/payment_type_screen.dart';
import '../../settings/profile_screen.dart';
import '../../settings/store_grid_screen.dart';

class DashboardHeaderCards extends StatelessWidget {
  const DashboardHeaderCards({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    List cardItems = [
      {
        'leading': "assets/card_image_one.PNG",
        'title': 'Total Order',
        'subtitle': ordersData.totalOrders
      },
      {
        'leading': "assets/card_image_two.PNG",
        'title': 'Unpaid Orders',
        'subtitle': ordersData.unpaidOrder.count
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Total Earning',
        'subtitle': ordersData.totalEarning
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Profile',
        'subtitle': 'Manage Profile'
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Stores',
        'subtitle': 'Manage Stores'
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Payment Methods',
        'subtitle': 'Manage Payment Methods'
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Employees',
        'subtitle': 'Manage Employees'
      },
      {
        'leading': "assets/card_image_three.PNG",
        'title': 'Discounts',
        'subtitle': 'Manage Discounts'
      }
    ];

    const iconList = <IconData>[
      Icons.shopping_bag_outlined,
      Icons.shopping_bag_outlined,
      Icons.monetization_on,
      Icons.person_outlined,
      Icons.store,
      Icons.payment_outlined,
      Icons.people,
      Icons.discount
    ];

    const screenList = <String>[
      "",
      "",
      "",
      ProfileScreen.routeName,
      StoreGridScreen.routeName,
      PaymentTypeScreen.routeName,
      "",
      DiscountScreen.routeName,
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
                            (screenList[index] == '')
                                ? null
                                : Navigator.pushReplacementNamed(
                                    context, screenList[index]);
                          },
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          tileColor: AppColor.saasifyWhite,
                          leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.saasifyPaleGrey),
                              child: Icon(iconList[index])),
                          title: Padding(
                              padding: const EdgeInsets.only(
                                  left: spacingXSmall, top: spacingStandard),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cardItems[index]['title'].toString(),
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
