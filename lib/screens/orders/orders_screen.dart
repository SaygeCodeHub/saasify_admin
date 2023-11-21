import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';

import 'orders_list_screen.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = 'OrdersScreen';

  static List<bool> selectedCheckboxes = List.generate(10, (index) => false);

  OrdersScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 5),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kOrders),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 1),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(
                        children: [
                          Row(children: [
                            context.responsive(const SizedBox(),
                                desktop: Text(StringConstants.kOrders,
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTiny
                                        .copyWith(
                                            fontWeight: FontWeight.w700))),
                            context.responsive(const SizedBox(),
                                desktop: const Spacer()),
                            Expanded(
                              flex: 5,
                              child: CustomTextField(
                                  hintText: StringConstants.kSearchHere,
                                  onTextFieldChanged: (value) {}),
                            ),
                            const Spacer(),
                          ]),
                          const SizedBox(height: spacingStandard),
                          const OrdersListDataTable(),
                        ],
                      )))
            ]));
  }
}
