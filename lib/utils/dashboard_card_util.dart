import 'package:flutter/material.dart';
import '../data/models/dashboard/dashboard_card.dart';
import '../screens/discount/discount_screen.dart';
import '../screens/settings/payment_type_screen.dart';
import '../screens/settings/profile_screen.dart';
import '../screens/settings/store_grid_screen.dart';

List<DashboardCard> dashboardCard = [
  DashboardCard(
    iconName: Icons.shopping_bag_outlined,
    routeName: '',
    title: 'Total Order',
  ),
  DashboardCard(
      iconName: Icons.shopping_bag_outlined,
      routeName: '',
      title: 'Unpaid Orders'),
  DashboardCard(
      iconName: Icons.monetization_on, routeName: '', title: 'Total Earning'),
  DashboardCard(
      iconName: Icons.person_outlined,
      routeName: ProfileScreen.routeName,
      title: 'Profile'),
  DashboardCard(
      iconName: Icons.store,
      routeName: StoreGridScreen.routeName,
      title: 'Branches'),
  DashboardCard(
      iconName: Icons.payment_outlined,
      routeName: PaymentTypeScreen.routeName,
      title: 'Payment Methods'),
  DashboardCard(iconName: Icons.people, routeName: '', title: 'Employees'),
  DashboardCard(
      iconName: Icons.discount,
      routeName: DiscountScreen.routeName,
      title: 'Coupons')
];
