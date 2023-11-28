import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/customer/customer_bloc.dart';
import 'package:saasify/bloc/customer/customer_event.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/customer_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import 'package:saasify/widgets/primary_button.dart';

class UnsettledTabs extends StatelessWidget {
  final List customerIdList;
  final Map<String, Customer> customerData;

  const UnsettledTabs({
    super.key,
    required this.customerIdList,
    required this.customerData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          context.responsive(const SizedBox.shrink(),
              desktop: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: spacingMedium, vertical: spacingLarge),
                child: Text(StringConstants.kUnsettledTabs,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiny
                        .copyWith(fontWeight: FontWeight.w700)),
              )),
          GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: context.responsive(0.95, desktop: 1.05)),
              itemCount: customerIdList.length + 1,
              itemBuilder: (context, index) {
                if (customerIdList.length == index) {
                  return Padding(
                      padding: const EdgeInsets.all(spacingStandard),
                      child: InkWell(
                          onTap: () {
                            context
                                .read<BillingBloc>()
                                .add(BillingInitialEvent(orderIndex: '-1'));
                          },
                          child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              margin: EdgeInsets.zero,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.all(spacingStandard),
                                  child: Center(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        const SizedBox(height: spacingStandard),
                                        Expanded(
                                          child: Image.asset('assets/add.png',
                                              fit: BoxFit.fill),
                                        ),
                                        const SizedBox(height: spacingXXSmall),
                                        Text(
                                          StringConstants.kNewTab,
                                          style: Theme.of(context)
                                              .textTheme
                                              .tiniest
                                              .copyWith(
                                                  color: AppColor.saasifyBlack),
                                        ),
                                      ]))))));
                }
                return Padding(
                    padding: const EdgeInsets.all(spacingStandard),
                    child: InkWell(
                        onTap: () {
                          context.read<BillingBloc>().orderId =
                              customerIdList[index];
                          context.read<BillingBloc>().add(BillingInitialEvent(
                              orderIndex: customerIdList[index]));
                          context.read<CustomerBloc>().add(GetCustomer(
                              customerContact:
                                  customerData[customerIdList[index]]!
                                      .customerContact));
                        },
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            margin: EdgeInsets.zero,
                            child: Padding(
                                padding: const EdgeInsets.all(spacingStandard),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 20),
                                            const Spacer(flex: 2),
                                            Expanded(
                                                flex: 4,
                                                child: Image.asset(
                                                    'assets/user.png',
                                                    fit: BoxFit.fill)),
                                            const Spacer(flex: 2),
                                            // const Spacer(flex: 6),
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialogueBox(
                                                                title:
                                                                    StringConstants
                                                                        .kWarning,
                                                                message:
                                                                    'The Given Tab Will be Removed',
                                                                primaryButtonTitle:
                                                                    StringConstants
                                                                        .kConfirm,
                                                                primaryOnPressed:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  context
                                                                      .read<
                                                                          BillingBloc>()
                                                                      .add(RemovePendingOrder(
                                                                          orderID:
                                                                              customerIdList[index]));
                                                                },
                                                                secondaryButtonTitle:
                                                                    StringConstants
                                                                        .kCancel,
                                                                secondaryOnPressed:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ));
                                                },
                                                child: Image.asset(
                                                    'assets/close.png',
                                                    height: kCloseIconSize,
                                                    width: kCloseIconSize))
                                          ]),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: spacingSmall,
                                              vertical: spacingXXSmall),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    (customerData["${customerIdList[index]}"]!
                                                                .customerName !=
                                                            '')
                                                        ? customerData[
                                                                "${customerIdList[index]}"]!
                                                            .customerName
                                                        : 'Customer',
                                                    textScaleFactor:
                                                        context.responsive(0.85,
                                                            desktop: 1),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .tiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                const SizedBox(
                                                    height: spacingSmallest),
                                                Text(
                                                    'Total - ₹ ${customerData["${customerIdList[index]}"]!.billDetails.total}',
                                                    textScaleFactor:
                                                        context.responsive(0.85,
                                                            tablets: 1),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xTiniest
                                                        .copyWith(
                                                            color: AppColor
                                                                .saasifyLightDeepBlue))
                                              ]),
                                        ),
                                      ),
                                      PrimaryButton(
                                          onPressed: () {},
                                          buttonTitle:
                                              StringConstants.kSettleBill)
                                    ])))));
              }),
        ]));
  }
}
