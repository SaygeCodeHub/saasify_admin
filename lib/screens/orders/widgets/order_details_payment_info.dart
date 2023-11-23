import 'package:flutter/material.dart';
import 'package:saasify/screens/orders/widgets/payment_info_widget.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'customer_info_widget.dart';
import 'order_info_widget.dart';

class OrderDetailsPaymentInfo extends StatelessWidget {
  const OrderDetailsPaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.saasifyWhite,
            borderRadius: BorderRadius.circular(kCircularRadius)),
        child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: spacingLarge, vertical: spacingLarge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomerInfoWidget(),
                      OrderInfoWidget(),
                    ],
                  ),
                  SizedBox(
                    height: spacingExcel,
                  ),
                  PaymentInfoWidget(),
                ])));
  }
}
