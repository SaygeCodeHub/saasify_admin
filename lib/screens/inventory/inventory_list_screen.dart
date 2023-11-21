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
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_alert_box.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';

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
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kInventoryManagement),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 1),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<InventoryBloc, InventoryStates>(
                        listener: (context, state) {
                          if (state is UpdatingStock) {
                            ProgressBar.show(context);
                          } else if (state is UpdatedStock) {
                            ProgressBar.dismiss(context);
                            showDialog(
                                context: context,
                                builder: (dialogueCtx) {
                                  return CustomAlertDialog(
                                      title: 'Success',
                                      message: state.message,
                                      primaryButtonTitle:
                                          StringConstants.kUnderstood,
                                      primaryOnPressed: () {
                                        Navigator.pop(dialogueCtx);
                                        context
                                            .read<InventoryBloc>()
                                            .add(FetchInventoryList());
                                      });
                                });
                          } else if (state is ErrorUpdatingStock) {
                            ProgressBar.dismiss(context);
                            showDialog(
                                context: context,
                                builder: (dialogueCtx) {
                                  return CustomAlertDialog(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle:
                                          StringConstants.kUnderstood,
                                      primaryOnPressed: () {
                                        Navigator.pop(dialogueCtx);
                                      });
                                });
                          }
                        },
                        buildWhen: (prev, curr) {
                          return curr is FetchedInventoryList ||
                              curr is FetchingInventoryList;
                        },
                        builder: (context, state) {
                          if (state is FetchingInventoryList) {
                            return const Expanded(
                                child:
                                    Center(child: CircularProgressIndicator()));
                          } else if (state is FetchedInventoryList) {
                            return Column(
                              children: [
                                Row(children: [
                                  context.responsive(const SizedBox(),
                                      desktop: Text(
                                          StringConstants.kInventoryManagement,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiny
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.w700))),
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
                                InventoryListDataTable(
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
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor
                                                        .saasifyLightGrey)))),
                                Visibility(
                                    visible: state.productList.isEmpty,
                                    child: const Spacer())
                              ],
                            );
                          } else if (state is ErrorFetchingInventoryList) {
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
