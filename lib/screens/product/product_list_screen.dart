import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';
import '../../bloc/product/product_state.dart';
import '../../configs/app_color.dart';
import '../../widgets/custom_alert_box.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = 'ProductListScreen';

  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

final List<ProductListScreen> rowDataList = [];
var selectedCheckboxes = List.generate(10, (index) => false);

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductList());
    return Scaffold(
        body: Row(children: [
      const Expanded(child: SideBar(selectedIndex: 1)),
      Expanded(
          flex: 5,
          child: Padding(
              padding: const EdgeInsets.all(spacingLarge),
              child: Column(children: [
                Row(children: [
                  Text(StringConstants.kProducts,
                      style: Theme.of(context)
                          .textTheme
                          .xxTiny
                          .copyWith(fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        hintText: 'Search here....',
                        onTextFieldChanged: (value) {}),
                  ),
                  const Spacer(),
                  SizedBox(
                      width: 180,
                      child: PrimaryButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                      title: StringConstants.kAddNewProduct,
                                      message: StringConstants.kScanTheBarcode,
                                      primaryButtonTitle:
                                          StringConstants.kScanBarcode,
                                      secondaryButtonTitle:
                                          StringConstants.kAddManually,
                                      checkMarkVisible: false,
                                      secondaryOnPressed: () {
                                        Navigator.pushReplacementNamed(context,
                                            AddProductScreen.routeName);
                                      },
                                      primaryOnPressed: () {},
                                      crossIconVisible: true,
                                    ));
                          },
                          buttonTitle: 'Add Product'))
                ]),
                const SizedBox(height: spacingStandard),
                BlocBuilder<ProductBloc, ProductStates>(
                  builder: (context, state) {
                    if (state is FetchingProduct) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchedProduct) {
                      return Expanded(
                          child: ListView(children: <Widget>[
                        DataTable(
                            columnSpacing: 0,
                            horizontalMargin: 30,
                            showCheckboxColumn: true,
                            headingRowHeight: 50,
                            dataRowMaxHeight: 50,
                            columns: [
                              DataColumn(
                                label: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (selectedCheckboxes
                                            .contains(false)) {
                                          selectedCheckboxes =
                                              List.generate(1, (index) => true);
                                        } else {
                                          selectedCheckboxes;
                                          selectedCheckboxes = List.generate(
                                              1, (index) => false);
                                        }
                                      });
                                    },
                                    child: Icon(
                                        (selectedCheckboxes.contains(true) &&
                                                selectedCheckboxes
                                                    .contains(false))
                                            ? Icons
                                                .indeterminate_check_box_outlined
                                            : (selectedCheckboxes
                                                    .contains(true))
                                                ? Icons.check_box
                                                : Icons.check_box_outline_blank,
                                        color: (selectedCheckboxes
                                                .contains(true))
                                            ? AppColor.saasifyLightDeepBlue
                                            : AppColor.saasifyLightDeepBlue)),
                              ),
                              DataColumn(
                                  label: Text('Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Product ID',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Price',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Discounted Price',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Stock',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))),
                              DataColumn(
                                  label: Text('Actions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500)))
                            ],
                            rows: List.generate(
                                state.productListModel.data.length,
                                (index) => DataRow(cells: [
                                      DataCell(
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedCheckboxes[index] =
                                                    !selectedCheckboxes[index];
                                              });
                                            },
                                            child: Icon(
                                              selectedCheckboxes[index]
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank_rounded,
                                              color: selectedCheckboxes[index]
                                                  ? AppColor
                                                      .saasifyLightDeepBlue
                                                  : AppColor
                                                      .saasifyLightDeepBlue,
                                            )),
                                      ),
                                      DataCell(Text(
                                          state.productListModel.data[index]
                                              .productName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest)),
                                      DataCell(
                                        Text(
                                            state.productListModel.data[index]
                                                .productId
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiniest),
                                      ),
                                      DataCell(Text(
                                          state.productListModel.data[index]
                                              .categoryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest)),
                                      DataCell(Text(
                                          state.productListModel.data[index]
                                              .variantCost
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest)),
                                      DataCell(Text(
                                          state.productListModel.data[index]
                                              .discountedCost
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest)),
                                      DataCell(Text(
                                          state.productListModel.data[index]
                                              .stock
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest)),
                                      DataCell(
                                        PopupMenuButton(
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                    onTap: () {
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              AddProductScreen
                                                                  .routeName);
                                                    },
                                                    child: const Text('Edit')),
                                                const PopupMenuItem(
                                                    child: Text('Delete'))
                                              ];
                                            },
                                            child: const Icon(Icons.more_vert)),
                                      )
                                    ])))
                      ]));
                    } else if (state is FetchProductError) {
                      return const Expanded(child: Text('No Data Available'));
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ])))
    ]));
  }
}
