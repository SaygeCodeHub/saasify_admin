import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/sidebar.dart';

class DashboardsScreen extends StatelessWidget {
  static const String routeName = 'DashboardsScreen';
  DashboardsScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
          direction:
              context.responsive(Axis.vertical, desktop: Axis.horizontal),
          children: [
            context.responsive(
                Container(
                    color: AppColor.saasifyLightDeepBlue,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: spacingSmall, horizontal: spacingLarge),
                        child: IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            iconSize: 30,
                            icon: const Icon(Icons.menu,
                                color: AppColor.saasifyWhite)),
                      )
                    ])),
                desktop: const Expanded(
                  child: SideBar(selectedIndex: 1),
                )),
            Expanded(
                flex: 5,
                child: Center(
                    child: Text('Dashboard',
                        style: Theme.of(context)
                            .textTheme
                            .tinier
                            .copyWith(fontWeight: FontWeight.w500))))
          ],
        ));
  }
}
