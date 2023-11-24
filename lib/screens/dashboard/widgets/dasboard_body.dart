import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/dashboard/widgets/dashboard_order_table_list.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, required this.ordersData});

  final List<OrdersData> ordersData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: DashboardOrderTableList(
            ordersData: ordersData,
          ),
        ),
        const SizedBox(width: spacingXXHuge),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: kContainerHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kCircularRadius),
                      boxShadow: const [
                        BoxShadow(blurRadius: 1, color: AppColor.saasifyWhite)
                      ],
                      color: AppColor.saasifyWhite),
                  child: Padding(
                    padding: const EdgeInsets.all(kCardRadius),
                    child: Container(
                        height: kDashContainerHeight,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kCircularRadius),
                            gradient: const LinearGradient(colors: [
                              AppColor.saasifyLightDeepBlue,
                              AppColor.saasifyDeepBlue,
                            ])),
                        child: Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(kCircularRadius),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Yearly Details are available",
                                        style: Theme.of(context)
                                            .textTheme
                                            .xTiniest
                                            .copyWith(
                                                color: AppColor.saasifyWhite,
                                                fontWeight: FontWeight.w700)),
                                    const SizedBox(height: spacingSmall),
                                    SizedBox(
                                      width: kGeneralActionButtonWidth,
                                      child: Text(
                                          "You will get an complete overview for the  Categories and Orders",
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest
                                              .copyWith(
                                                  color: AppColor.saasifyWhite),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(width: spacingLarge),
                          Expanded(
                            child: Container(
                              height: spacingXXHuge,
                              width: spacingXXXHuge,
                              decoration: BoxDecoration(
                                  color: AppColor.saasifyLightBlue,
                                  borderRadius:
                                      BorderRadius.circular(kCircularRadius)),
                              child: Center(
                                child: Text("Insights",
                                    style: Theme.of(context)
                                        .textTheme
                                        .xTiniest
                                        .copyWith(
                                            // color: AppColor.saasifyWhite,
                                            fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10)
                        ])),
                  )),
              const SizedBox(height: spacingLarge),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kCircularRadius)),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  onDateChanged: (DateTime value) {},
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
