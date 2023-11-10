import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/inventory/widgets/inventory_list_data_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';

import '../../bloc/inventory/inventory_bloc.dart';
import '../../bloc/inventory/inventory_event.dart';
import '../../bloc/inventory/inventory_states.dart';

class InventoryListScreen extends StatelessWidget {
  static const String routeName = 'InventoryListScreen';

  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<InventoryBloc>().add(FetchInventoryList());
    return Scaffold(
        body: Row(children: [
      const Expanded(child: SideBar(selectedIndex: 1)),
      Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child: BlocBuilder<InventoryBloc, InventoryStates>(
              builder: (BuildContext context, state) {
                if (state is FetchingInventoryProductList) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchedInventoryProductList) {
                  return Column(children: [
                    Row(children: [
                      SizedBox(
                        width: 200,
                        child: Text(StringConstants.kInventoryManagement,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .xxTiny
                                .copyWith(fontWeight: FontWeight.w700)),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            hintText: StringConstants.kSearchHere,
                            onTextFieldChanged: (value) {}),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 180,
                          child: PrimaryButton(
                              onPressed: () {},
                              buttonTitle: StringConstants.kAddNewOrder))
                    ]),
                    const SizedBox(height: spacingStandard),
                    InventoryListDataTable(
                        inventoryProductList: state.inventoryProductList)
                  ]);
                } else if (state is FetchInventoryProductListError) {
                  return const Expanded(
                      child: Text(StringConstants.kNoDataAvailable));
                } else {
                  return const SizedBox.shrink();
                }
              },
              // listener: (BuildContext context, Object? state) {},
            ),
          ))
    ]));
  }
}
