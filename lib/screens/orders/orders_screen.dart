import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/orders/orders_bloc.dart';
import 'package:saasify/bloc/orders/orders_event.dart';
import 'package:saasify/bloc/orders/orders_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';
import '../../configs/app_color.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/custom_alert_box.dart';
import 'orders_list_datatable.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = 'OrdersScreen';

  OrdersScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(FetchOrdersList());

    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 4),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kOrders),
                  desktop: const Expanded(child: SideBar(selectedIndex: 4))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<OrdersBloc, OrdersStates>(
                          listener: (context, state) {
                        if (state is ErrorFetchingOrders) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return CustomAlertDialog(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                    });
                              });
                        }
                      }, buildWhen: (prev, curr) {
                        return curr is FetchedOrders || curr is FetchingOrders;
                      }, builder: (context, state) {
                        if (state is FetchingOrders) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedOrders) {
                          return Column(children: [
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
                                      onTextFieldChanged: (value) {})),
                              const Spacer()
                            ]),
                            const SizedBox(height: spacingStandard),
                            OrdersListDataTable(
                                ordersData: state.fetchOrdersList),
                            Visibility(
                                visible: state.fetchOrdersList.isEmpty,
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
                                visible: state.fetchOrdersList.isEmpty,
                                child: const Spacer())
                          ]);
                        } else if (state is ErrorFetchingOrders) {
                          return Expanded(
                              child: Center(
                                  child: Text(StringConstants.kNoDataAvailable,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              color:
                                                  AppColor.saasifyLightGrey))));
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
