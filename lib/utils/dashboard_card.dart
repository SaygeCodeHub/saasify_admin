import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import '../data/models/dashboard/dashboard_card.dart';
import '../screens/settings/discount_screen.dart';
import '../screens/settings/payment_type_screen.dart';
import '../screens/settings/profile_screen.dart';
import '../screens/settings/store_grid_screen.dart';

List<DashboardCardData> dashboardCard = [
  DashboardCardData(
      iconName: Icons.shopping_bag_outlined,
      routeName: '',
      title: 'Total Order',
      subtitle: '',
      color: AppColor.saasifyLightDeepBlue),
  DashboardCardData(
      color: AppColor.saasifyLightestGrey,
      iconName: Icons.shopping_bag_outlined,
      routeName: '',
      title: 'Unpaid Orders',
      subtitle: ''),
  DashboardCardData(
      color: AppColor.saasifyPalestGrey,
      iconName: Icons.monetization_on,
      routeName: '',
      title: 'Total Earning',
      subtitle: ''),
  DashboardCardData(
      color: AppColor.saasifyPalestWhite,
      iconName: Icons.person_outlined,
      routeName: ProfileScreen.routeName,
      title: 'Profile',
      subtitle: 'Manage Profile'),
  DashboardCardData(
      color: AppColor.saasifyLightDeepBlue,
      iconName: Icons.store,
      routeName: StoreGridScreen.routeName,
      title: 'Branches',
      subtitle: 'Manage Branches'),
  DashboardCardData(
      color: AppColor.saasifyLightestGrey,
      iconName: Icons.payment_outlined,
      routeName: PaymentTypeScreen.routeName,
      title: 'Payment Methods',
      subtitle: 'Manage Payment Methods'),
  DashboardCardData(
      color: AppColor.saasifyPalestGrey,
      iconName: Icons.people,
      routeName: '',
      title: 'Employees',
      subtitle: 'Manage Employees'),
  DashboardCardData(
      color: AppColor.saasifyPalestWhite,
      iconName: Icons.discount,
      routeName: DiscountScreen.routeName,
      title: 'Coupons',
      subtitle: 'Manage Coupons')
];
