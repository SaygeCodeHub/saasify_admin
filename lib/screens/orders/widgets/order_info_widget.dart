import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';

class OrderInfoWidget extends StatelessWidget {
  final OrdersData ordersData;

  const OrderInfoWidget({super.key, required this.ordersData});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: kAvatarRadius,
            backgroundColor: AppColor.saasifyLightestPaleGrey,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.saasifyBlack,
            ),
          ),
          const SizedBox(width: spacingXMedium),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Order Info',
                  style: Theme.of(context)
                      .textTheme
                      .tinier
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: spacingXSmall),
                Row(
                  children: [
                    Text(
                      'Shipping:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue),
                    ),
                    const SizedBox(width: spacingXXSmall),
                    Text(
                      'Next Express',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: spacingXSmall),
                Row(
                  children: [
                    Text('Payment Method:',
                        style: Theme.of(context)
                            .textTheme
                            .xTiniest
                            .copyWith(color: AppColor.saasifyGreyBlue)),
                    const SizedBox(width: spacingXXSmall),
                    Text(
                      'Stripe',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Status:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(ordersData.paymentStatus,
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ])
              ])
        ]);
  }
}
