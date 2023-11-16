import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/bloc/inventory/inventory_states.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/inventory/widgets/inventory_list_data_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/sidebar.dart';

class InventoryListScreen extends StatelessWidget {
  static const String routeName = 'InventoryListScreen';

  static List<bool> selectedCheckboxes = List.generate(10, (index) => false);

  InventoryListScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<InventoryBloc>().add(FetchInventoryList());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 5),
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
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(children: [
                        Row(children: [
                          Text(StringConstants.kInventoryManagement,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiny
                                  .copyWith(fontWeight: FontWeight.w700)),
                          const Spacer(),
                          Expanded(
                            flex: 5,
                            child: CustomTextField(
                                hintText: StringConstants.kSearchHere,
                                onTextFieldChanged: (value) {}),
                          ),
                          const Spacer(),
                          // SizedBox(
                          //     width: 180,
                          //     child: PrimaryButton(
                          //         onPressed: () {},
                          //         buttonTitle: StringConstants.kAddNewOrder))
                        ]),
                        const SizedBox(height: spacingStandard),
                        BlocBuilder<InventoryBloc, InventoryStates>(
                          builder: (context, state) {
                            if (state is FetchedInventoryList) {
                              return InventoryListDataTable(
                                  productList: state.productList);
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ])))
            ]));
  }
}
