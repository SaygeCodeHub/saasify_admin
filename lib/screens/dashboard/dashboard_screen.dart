import 'package:flutter/material.dart';
import 'package:saasify/widgets/sidebar.dart';

class DashboardsScreen extends StatelessWidget {
  static const String routeName = 'DashboardsScreen';
  const DashboardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Row(
      children: [
        Expanded(child: SideBar(selectedIndex: 1)),
        Expanded(flex: 5, child: Center(child: Text('Dashboard')))
      ],
    ));
  }
}
