import 'package:flutter/material.dart';
import 'package:saasify/screens/employee/widgets/add_employee_web_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/sidebar.dart';
import '../../../widgets/top_bar.dart';
import 'add_employee_mobile_screen.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const String routeName = 'AddEmployeeScreen';

  static Map dataMap = {};

  static List<int> selectedIds = [];

  AddEmployeeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kAddEmployee),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 1),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(spacingLarge),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return (constraints.maxWidth < 600)
                          ? AddEmployeeMobileScreen(dataMap: dataMap)
                          : AddEmployeeWebScreen(dataMap: dataMap);
                    }),
                  ))
            ]));
  }
}
