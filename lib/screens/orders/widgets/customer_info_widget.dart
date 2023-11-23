import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';

class CustomerInfoWidget extends StatelessWidget {
  final OrdersData ordersData;

  const CustomerInfoWidget({super.key, required this.ordersData});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.saasifyLightestPaleGrey,
              child: Icon(Icons.person_outlined, color: AppColor.saasifyBlack)),
          const SizedBox(width: spacingXMedium),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Customer',
                    style: Theme.of(context)
                        .textTheme
                        .tinier
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Name:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(ordersData.customerName,
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ]),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Email:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text('mariaaniston@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ]),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Phone:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(ordersData.customerContact.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ])
              ])
        ]);
  }
}
