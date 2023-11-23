import 'package:flutter/material.dart';
import 'package:saasify/screens/orders/widgets/payment_info_widget.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';
import 'customer_info_widget.dart';
import 'order_info_widget.dart';

class OrderDetailsPaymentInfo extends StatelessWidget {
  final OrdersData ordersData;

  const OrderDetailsPaymentInfo({super.key, required this.ordersData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.saasifyWhite,
            borderRadius: BorderRadius.circular(kCircularRadius)),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingLarge, vertical: spacingLarge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomerInfoWidget(ordersData: ordersData),
                        OrderInfoWidget(ordersData: ordersData)
                      ]),
                  const SizedBox(height: spacingExcel),
                  PaymentInfoWidget(ordersData: ordersData),
                ])));
  }
}
