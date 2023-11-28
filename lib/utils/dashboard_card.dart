import 'package:flutter/material.dart';
import '../data/models/dashboard/dashboard_card.dart';
import '../screens/discount/discount_screen.dart';
import '../screens/settings/payment_type_screen.dart';
import '../screens/settings/profile_screen.dart';
import '../screens/settings/store_grid_screen.dart';

List<DashboardCardData> dashboardCard = [
  DashboardCardData(
    iconName: Icons.shopping_bag_outlined,
    routeName: '',
    title: 'Total Order',
    subtitle: '',
  ),
  DashboardCardData(
      iconName: Icons.shopping_bag_outlined,
      routeName: '',
      title: 'Unpaid Orders',
      subtitle: ''),
  DashboardCardData(
      iconName: Icons.monetization_on,
      routeName: '',
      title: 'Total Earning',
      subtitle: ''),
  DashboardCardData(
      iconName: Icons.person_outlined,
      routeName: ProfileScreen.routeName,
      title: 'Profile',
      subtitle: 'Manage Profile'),
  DashboardCardData(
      iconName: Icons.store,
      routeName: StoreGridScreen.routeName,
      title: 'Branches',
      subtitle: 'Manage Branches'),
  DashboardCardData(
      iconName: Icons.payment_outlined,
      routeName: PaymentTypeScreen.routeName,
      title: 'Payment Methods',
      subtitle: 'Manage Payment Methods'),
  DashboardCardData(
      iconName: Icons.people,
      routeName: '',
      title: 'Employees',
      subtitle: 'Manage Employees'),
  DashboardCardData(
      iconName: Icons.discount,
      routeName: DiscountScreen.routeName,
      title: 'Coupons',
      subtitle: 'Manage Coupons')
];
