import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen_new.dart';
import 'package:saasify/screens/product/product_list_screen.dart';

class SideBar extends StatelessWidget {
  static String userName = '';
  static int userContact = 0;
  final int selectedIndex;

  const SideBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColor.saasifyWhite,
        surfaceTintColor: AppColor.saasifyTransparent,
        elevation: 4,
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(spacingStandard),
              child: Row(children: [
                const CircleAvatar(),
                const SizedBox(width: spacingSmall),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(userName,
                        style: Theme.of(context).textTheme.xTiniest.copyWith(
                            color: AppColor.saasifyLighterBlack,
                            fontWeight: FontWeight.w600)),
                    Text(userContact.toString(),
                        style: Theme.of(context).textTheme.xxxTiniest.copyWith(
                            color: AppColor.saasifyLighterBlack,
                            fontWeight: FontWeight.w300))
                  ],
                )
              ])),
          const Divider(),
          const SizedBox(height: spacingMedium),
          Padding(
              padding: const EdgeInsets.only(left: spacingLarge),
              child: Column(children: [
                ListTile(
                  title: Text('Dashboard',
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 1)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyDarkGrey,
                          fontWeight: FontWeight.w700)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, DashboardsScreen.routeName);
                  },
                ),
                ListTile(
                  title: Text('POS',
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 2)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyDarkGrey,
                          fontWeight: FontWeight.w700)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, POSTwoScreen.routeName);
                  },
                ),
                ListTile(
                  title: Text('Products',
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 3)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyDarkGrey,
                          fontWeight: FontWeight.w700)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ProductListScreen.routeName);
                  },
                ),
                ListTile(
                  title: Text('Orders',
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 4)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyDarkGrey,
                          fontWeight: FontWeight.w700)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Inventory Management',
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 5)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyDarkGrey,
                          fontWeight: FontWeight.w700)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, InventoryListScreen.routeName);
                  },
                ),
                // ListTile(
                //   title: Text('Profile Management',
                //       style: Theme.of(context).textTheme.xxxTiniest.copyWith(
                //           color: (selectedIndex == 6)
                //               ? AppColor.saasifyLightDeepBlue
                //               : AppColor.saasifyBlack)),
                //   onTap: () {},
                // ),
                // ListTile(
                //   title: Text('Insights',
                //       style: Theme.of(context).textTheme.xxxTiniest.copyWith(
                //           color: (selectedIndex == 7)
                //               ? AppColor.saasifyLightDeepBlue
                //               : AppColor.saasifyBlack)),
                //   onTap: () {},
                // )
              ])),
          const Divider(),
          Padding(
              padding: const EdgeInsets.only(left: spacingLarge),
              child: ListTile(
                title: Text('Log Out',
                    style: Theme.of(context).textTheme.xTiniest.copyWith(
                        color: AppColor.saasifyRed,
                        fontWeight: FontWeight.w700)),
                onTap: () {
                  context.read<AuthenticationBloc>().add(LogOut());
                  Navigator.pushNamedAndRemoveUntil(context,
                      AuthenticationScreen.routeName, (route) => false);
                },
              ))
        ]));
  }
}
