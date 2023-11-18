import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/pos_new/widgets/billing_section_two.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/sidebar.dart';
import '../../bloc/pos/billing_bloc.dart';
import '../../bloc/pos/billing_event.dart';
import '../../bloc/pos/billing_state.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import 'widgets/products_section.dart';

class POSTwoScreen extends StatelessWidget {
  static const routeName = 'POSScreen';

  POSTwoScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<BillingBloc>().add(FetchProductsByCategory());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 2),
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
                    child: SideBar(selectedIndex: 2),
                  )),
              Expanded(
                flex: 5,
                child: BlocBuilder<BillingBloc, BillingStates>(
                  builder: (context, state) {
                    if (state is FetchingProductsByCategory) {
                      return const Center(child: CircularProgressIndicator());
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
                                ? const Expanded(
                                    flex: 2, child: BillingSectionTwo())
                                : const SizedBox.shrink()
                          ]);
                    } else if (state is ErrorFetchingProductsByCategory) {
                      return const Expanded(
                          child: Text(StringConstants.kNoDataAvailable));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              )
            ]));
  }
}
