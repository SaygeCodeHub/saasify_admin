import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/widgets/add_payment_method_popup.dart';
import 'package:saasify/screens/settings/widgets/payment_type_gridview.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import '../dashboard/dashboard_screen.dart';

class PaymentTypeScreen extends StatelessWidget {
  static const String routeName = 'PaymentTypeScreen';

  PaymentTypeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List paymentType = [
    {
      'leading': "Cash",
    },
    {
      'leading': "Net Banking",
    },
    {
      'leading': "Card",
    },
    {
      'leading': "UPI",
    },
    {
      'leading': "GPay",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kStore),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: spacingXHuge,
                          top: spacingXMedium,
                          bottom: spacingXHuge,
                          left: spacingXHuge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, DashboardsScreen.routeName);
                                },
                                child: context.responsive(const SizedBox(),
                                    desktop:
                                        const Icon(Icons.arrow_back_ios_new))),
                            const SizedBox(width: spacingSmall),
                            context.responsive(const SizedBox(),
                                desktop: Text(StringConstants.kPaymentType,
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTiny
                                        .copyWith(
                                            fontWeight: FontWeight.w700))),
                            context.responsive(const SizedBox(),
                                desktop: const Spacer()),
                            const Spacer(),
                            SizedBox(
                                width: kGeneralActionButtonWidth,
                                child: PrimaryButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) =>
                                              const AddNewPaymentTypePopup());
                                    },
                                    buttonTitle:
                                        StringConstants.kAddNewPaymentMethod))
                          ]),
                          const SizedBox(height: spacingStandard),
                          PaymentTypeGridView(paymentType: paymentType)
                        ],
                      )))
            ]));
  }
}
