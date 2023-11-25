// import 'package:flutter/material.dart';
// import 'package:saasify/configs/app_theme.dart';
//
// import '../../../configs/app_color.dart';
// import '../../../configs/app_dimensions.dart';
// import '../../../configs/app_spacing.dart';
// import '../../../data/models/orders/fetch_orders_model.dart';
// import '../../../utils/constants/string_constants.dart';
//
// class OrderBillDetails extends StatelessWidget {
//   final OrdersData ordersData;
//
//   const OrderBillDetails({super.key, required this.ordersData});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: AppColor.saasifyWhite,
//             borderRadius: BorderRadius.circular(kCircularRadius)),
//         child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: spacingLarge, vertical: spacingLarge),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Text(StringConstants.kSubTotal,
//                     style: Theme.of(context).textTheme.xTiniest.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.saasifyDarkestBlack)),
//                 const SizedBox(height: spacingStandard),
//                 Text(ordersData.subtotal.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .xTiniest
//                         .copyWith(color: AppColor.saasifyGreyBlue))
//               ]),
//               const SizedBox(height: spacingSmall),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Text(StringConstants.kDiscount,
//                     style: Theme.of(context).textTheme.xTiniest.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.saasifyDarkestBlack)),
//                 Text(ordersData.discountTotal.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .xTiniest
//                         .copyWith(color: AppColor.saasifyGreyBlue))
//               ]),
//               const SizedBox(height: spacingStandard),
//               const Divider(color: AppColor.saasifyPaleWhite, thickness: 0.5),
//               const SizedBox(height: spacingXXSmall),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Text(StringConstants.kGrandTotal,
//                     style: Theme.of(context).textTheme.xTiniest.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.saasifyDarkestBlack)),
//                 Text(ordersData.totalAmount.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .xTiniest
//                         .copyWith(color: AppColor.saasifyGreyBlue))
//               ])
//             ])));
//   }
// }
