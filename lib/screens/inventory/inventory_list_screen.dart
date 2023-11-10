import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/inventory/widgets/inventory_list_data_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';

class InventoryListScreen extends StatelessWidget {
  static const String routeName = 'InventoryListScreen';

  static List<bool> selectedCheckboxes = List.generate(10, (index) => false);

  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      const Expanded(child: SideBar(selectedIndex: 1)),
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
                  SizedBox(
                      width: 180,
                      child: PrimaryButton(
                          onPressed: () {},
                          buttonTitle: StringConstants.kAddNewOrder))
                ]),
                const SizedBox(height: spacingStandard),
                // BlocConsumer<ProductBloc, ProductStates>(
                //   builder: (context, state) {
                //     if (state is FetchingInventoryList) {
                //       return const Center(child: CircularProgressIndicator());
                //     } else if (state is FetchedInventoryList) {
                const InventoryListDataTable(),
                //     } else if (state is FetchInventoryListError) {
                //       return const Expanded(
                //           child: Text(StringConstants.kNoDataAvailable));
                //     } else {
                //       return const SizedBox.shrink();
                //     }
                //   }, listener: (BuildContext context, ProductStates state) {  },
                // )
              ])))
    ]));
  }
}
