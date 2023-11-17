import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/pos_new/widgets/billing_section_two.dart';
import '../../bloc/pos/billing_bloc.dart';
import '../../bloc/pos/billing_event.dart';
import '../../bloc/pos/billing_state.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import 'pos_screen_left_part.dart';

class POSTwoScreen extends StatelessWidget {
  static const routeName = 'POSScreen';

  const POSTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BillingBloc>().add(FetchProductsByCategory());
    return Scaffold(
        body: Column(children: [
      Container(
          height: kImageHeight,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColor.saasifyLightDeepBlue,
          ),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: spacingXLarge),
                  child: Icon(Icons.menu,
                      color: AppColor.saasifyWhite, size: spacingXHuge)))),
      Expanded(
        child: BlocBuilder<BillingBloc, BillingStates>(
          builder: (context, state) {
            if (state is FetchingProductsByCategory) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsFetched) {
              return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                    flex: 7,
                    child:
                        POSScreenLeftPart(posData: state.productsByCategories)),
                const Expanded(flex: 3, child: BillingSectionTwo())
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
