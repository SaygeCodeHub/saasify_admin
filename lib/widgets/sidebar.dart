import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class SideBar extends StatelessWidget {
  final int selectedIndex;

  const SideBar({Key? key, required this.selectedIndex}) : super(key: key);

  final List<String> sideBarOptions = const [
    'DashBoard',
    'Products',
    'Orders',
    'Inventory Management',
    'Profile Management',
    'Insights'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/SaaSify.svg", width: kLogoWidth),
        const SizedBox(height: spacingXXXXHuge),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Dashboard',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 1)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Products',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 2)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Orders',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 3)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Inventory Management',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 4)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Profile Management',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 5)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Insights',
              style: Theme.of(context).textTheme.tiniest.copyWith(
                  color: (selectedIndex == 6)
                      ? AppColor.saasifyBlack
                      : AppColor.saasifyLightDeepBlue)),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.keyboard_option_key),
          title: Text('Insights',
              style: Theme.of(context)
                  .textTheme
                  .tiniest
                  .copyWith(color: AppColor.saasifyBlack)),
          onTap: () {},
        ),
      ],
    );
  }
}
