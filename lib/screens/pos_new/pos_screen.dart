import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos_new/widgets/billing_section.dart';
import 'package:saasify/utils/database_util.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_alert_box.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';
import '../../bloc/pos/billing_bloc.dart';
import '../../bloc/pos/billing_event.dart';
import '../../bloc/pos/billing_state.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import 'widgets/products_section.dart';

class POSScreen extends StatelessWidget {
  static const routeName = 'POSScreen';

  POSScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<BillingBloc>().add(LoadAllOrders());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 2),
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kOpenTabs),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 2),
                  )),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<BillingBloc, BillingStates>(
                      listener: (context, state) {
                    if (state is ErrorFetchingProductsByCategory) {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return CustomAlertDialog(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                primaryButtonTitle: StringConstants.kUnderstood,
                                primaryOnPressed: () {
                                  Navigator.pop(ctx);
                                });
                          });
                    }
                  }, builder: (context, state) {
                    if (state is FetchingProductsByCategory) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadDataBaseOrders) {
                      if (DatabaseUtil.ordersBox.isEmpty) {
                        context.read<BillingBloc>().add(BillingInitialEvent(
                            orderIndex:
                                context.read<BillingBloc>().orderIndex));
                      }
                      return Padding(
                          padding: const EdgeInsets.all(spacingStandard),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                context.responsive(const SizedBox.shrink(),
                                    desktop: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: spacingMedium,
                                          vertical: spacingLarge),
                                      child: Text(StringConstants.kOpenTabs,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiny
                                              .copyWith(
                                                  fontWeight: FontWeight.w700)),
                                    )),
                                GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5),
                                    itemCount: state.customerIdList.length + 1,
                                    itemBuilder: (context, index) {
                                      if (state.customerIdList.length ==
                                          index) {
                                        return Padding(
                                            padding: const EdgeInsets.all(
                                                spacingStandard),
                                            child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<BillingBloc>()
                                                      .add(BillingInitialEvent(
                                                          orderIndex: -1));
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            spacingStandard),
                                                    decoration: BoxDecoration(
                                                      color: AppColor
                                                          .saasifyLightDeepBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Center(
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                          Text(
                                                            StringConstants
                                                                .kAddCustomer,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .tiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyWhite),
                                                          ),
                                                          const SizedBox(
                                                              height:
                                                                  spacingStandard),
                                                          Expanded(
                                                            child: Image.asset(
                                                                'assets/add.png',
                                                                fit: BoxFit
                                                                    .fill),
                                                          )
                                                        ])))));
                                      }
                                      return Padding(
                                          padding: const EdgeInsets.all(
                                              spacingStandard),
                                          child: InkWell(
                                              onTap: () {
                                                context
                                                        .read<BillingBloc>()
                                                        .orderIndex =
                                                    state.customerIdList[index];
                                                context.read<BillingBloc>().add(
                                                    BillingInitialEvent(
                                                        orderIndex: state
                                                                .customerIdList[
                                                            index]));
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColor
                                                          .saasifyLightDeepBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              kCircularRadius)),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              spacingStandard),
                                                      child: Center(
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                            Text(
                                                              'Customer no. - ${state.customerIdList[index]}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .tiniest
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .saasifyWhite),
                                                            ),
                                                            const SizedBox(
                                                                height:
                                                                    spacingStandard),
                                                            Expanded(
                                                              child: Image.asset(
                                                                  'assets/user.png',
                                                                  fit: BoxFit
                                                                      .fill),
                                                            )
                                                          ]))))));
                                    }),
                              ]));
                    } else if (state is ProductsLoaded) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 5,
                                child: ProductsSection(
                                    posData: state.productsByCategories)),
                            context
                                    .read<BillingBloc>()
                                    .selectedProducts
                                    .isNotEmpty
                                ? Expanded(
                                    flex: 2,
                                    child: BillingSection(
                                        posData: state.productsByCategories))
                                : const SizedBox.shrink()
                          ]);
                    } else if (state is ErrorFetchingProductsByCategory) {
                      return const Center(
                          child: Text(StringConstants.kNoDataAvailable));
                    } else {
                      return const SizedBox.shrink();
                    }
                  }))
            ]));
  }
}
