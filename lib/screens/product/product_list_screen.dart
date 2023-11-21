import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/screens/product/widgets/product_list_data_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';
import '../../widgets/custom_alert_box.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = 'ProductListScreen';

  static List<int> selectedIds = [];

  ProductListScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductList());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 3),
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
                              iconSize: kGeneralRadius,
                              icon: const Icon(Icons.menu,
                                  color: AppColor.saasifyWhite)),
                        )
                      ])),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 3),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<ProductBloc, ProductStates>(
                        listener: (context, state) {
                          if (state is DeletingProducts) {
                            ProgressBar.show(context);
                          }
                          if (state is DeletedProducts) {
                            ProgressBar.dismiss(context);

                            showDialog(
                                context: context,
                                builder: (ctx) => CustomAlertDialog(
                                      title: StringConstants.kSuccess,
                                      message: state.message,
                                      primaryButtonTitle:
                                          StringConstants.kUnderstood,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        context
                                            .read<ProductBloc>()
                                            .add(FetchProductList());
                                        ProductListScreen.selectedIds = [];
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                          if (state is ErrorDeletingProducts) {
                            ProgressBar.dismiss(context);
                            showDialog(
                                context: context,
                                builder: (ctx) => CustomAlertDialog(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle:
                                          StringConstants.kUnderstood,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                          if (state is ErrorFetchingProduct) {
                            showDialog(
                                context: context,
                                builder: (ctx) => CustomAlertDialog(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle:
                                          StringConstants.kUnderstood,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                        },
                        buildWhen: (prev, curr) {
                          return curr is FetchingProduct ||
                              curr is FetchedProduct ||
                              curr is ErrorFetchingProduct;
                        },
                        builder: (context, state) {
                          if (state is FetchingProduct) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FetchedProduct) {
                            return Column(
                              children: [
                                Row(children: [
                                  Text(StringConstants.kProducts,
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiny
                                          .copyWith(
                                              fontWeight: FontWeight.w700)),
                                  const Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: CustomTextField(
                                        hintText: StringConstants.kSearchHere,
                                        onTextFieldChanged: (value) {}),
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: selectedIds.isNotEmpty,
                                    child: SizedBox(
                                        width: kGeneralActionButtonWidth,
                                        child: PrimaryButton(
                                            backgroundColor:
                                                AppColor.saasifyRed,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      CustomAlertDialog(
                                                        title: StringConstants
                                                            .kWarning,
                                                        message: StringConstants
                                                            .kTheSelectedProducts,
                                                        primaryButtonTitle:
                                                            StringConstants
                                                                .kConfirm,
                                                        secondaryButtonTitle:
                                                            StringConstants
                                                                .kCancel,
                                                        checkMarkVisible: false,
                                                        secondaryOnPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        primaryOnPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          context
                                                              .read<
                                                                  ProductBloc>()
                                                              .add(DeleteProducts(
                                                                  variantIds:
                                                                      selectedIds));
                                                        },
                                                      ));
                                            },
                                            buttonTitle:
                                                StringConstants.kDelete)),
                                  ),
                                  const SizedBox(width: spacingStandard),
                                  SizedBox(
                                      width: kGeneralActionButtonWidth,
                                      child: PrimaryButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CustomAlertDialog(
                                                      title: StringConstants
                                                          .kAddNewProduct,
                                                      message: StringConstants
                                                          .kScanTheBarcode,
                                                      primaryButtonTitle:
                                                          StringConstants
                                                              .kScanBarcode,
                                                      secondaryButtonTitle:
                                                          StringConstants
                                                              .kAddManually,
                                                      checkMarkVisible: false,
                                                      secondaryOnPressed: () {
                                                        Navigator.pushReplacementNamed(
                                                            context,
                                                            AddProductScreen
                                                                .routeName,
                                                            arguments:
                                                                AddProductScreenArguments(
                                                                    isEdit:
                                                                        false,
                                                                    isVariant:
                                                                        false,
                                                                    dataMap: {}));
                                                      },
                                                      primaryOnPressed: () {},
                                                    ));
                                          },
                                          buttonTitle:
                                              StringConstants.kAddProduct))
                                ]),
                                const SizedBox(height: spacingStandard),
                                ProductListDataTable(
                                    productList: state.productList),
                                Visibility(
                                    visible: state.productList.isEmpty,
                                    child: Center(
                                        child: Text(
                                            StringConstants.kNoDataAvailable,
                                            style: Theme.of(context)
                                                .textTheme
                                                .tinier
                                                .copyWith(
                                                    color: AppColor
                                                        .saasifyLightGrey)))),
                                Visibility(
                                    visible: state.productList.isEmpty,
                                    child: const Spacer())
                              ],
                            );
                          } else if (state is ErrorFetchingProduct) {
                            return Expanded(
                                child: Center(
                                    child: Text(
                                        StringConstants.kNoDataAvailable,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                color: AppColor
                                                    .saasifyLightGrey))));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )))
            ]));
  }
}
