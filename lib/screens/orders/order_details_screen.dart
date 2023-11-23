import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import 'order_details_list_datatable.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const String routeName = 'OrderDetailsScreen';

  OrderDetailsScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.saasifyLightGreyBlue,
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
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 4),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              context.responsive(const SizedBox(),
                                  desktop: Text(StringConstants.kOrderDetails,
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiny
                                          .copyWith(
                                              fontWeight: FontWeight.w700))),
                              context.responsive(const SizedBox(),
                                  desktop: const Spacer()),
                              const Spacer()
                            ]),
                            const SizedBox(height: spacingStandard),
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColor.saasifyWhite,
                                    borderRadius:
                                        BorderRadius.circular(kCircularRadius)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: spacingLarge,
                                        vertical: spacingLarge),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Order ID:123456',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xTiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  const SizedBox(
                                                    height: spacingXSmall,
                                                  ),
                                                  Text('Mon,July 22,2023',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xxTiniest),
                                                  const SizedBox(
                                                    height: spacingXXSmall,
                                                  ),
                                                  Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4,
                                                          horizontal: 8),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: AppColor
                                                              .saasifyLighterGreen),
                                                      child: Text('Approved',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xxTiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyGreen))),
                                                ],
                                              ),
                                              // const CustomDropdownTwoWidget(
                                              //   listItems: [{
                                              //     'one':'event'
                                              //   }],),
                                            ],
                                          ),
                                        ]))),
                            const SizedBox(
                              height: spacingMedium,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColor.saasifyWhite,
                                    borderRadius:
                                        BorderRadius.circular(kCircularRadius)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: spacingLarge,
                                        vertical: spacingLarge),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor: AppColor
                                                        .saasifyLightestPaleGrey,
                                                    child: Icon(
                                                      Icons.person_outlined,
                                                      color:
                                                          AppColor.saasifyBlack,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: spacingXMedium,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Customer',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .tinier
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Name:',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyGreyBlue),
                                                          ),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            'Maria Aniston',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text('Email:',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .saasifyGreyBlue)),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            'mariaaniston@gmail.com',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text('Phone:',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .saasifyGreyBlue)),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            '+1 (065) 7865567',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor: AppColor
                                                        .saasifyLightestPaleGrey,
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      color:
                                                          AppColor.saasifyBlack,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: spacingXMedium,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Order Info',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .tinier
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Shipping:',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .saasifyGreyBlue),
                                                          ),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            'Next Express',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              'Payment Method:',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .saasifyGreyBlue)),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            'Stripe',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: spacingXSmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text('Status:',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .saasifyGreyBlue)),
                                                          const SizedBox(
                                                            width:
                                                                spacingXXSmall,
                                                          ),
                                                          Text(
                                                            'Approved',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: spacingExcel,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const CircleAvatar(
                                                radius: 25,
                                                backgroundColor: AppColor
                                                    .saasifyLightestPaleGrey,
                                                child: Icon(
                                                  Icons.payment_outlined,
                                                  color: AppColor.saasifyBlack,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: spacingXMedium,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Payment Info',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .tinier
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  const SizedBox(
                                                    height: spacingXSmall,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Master Card:',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xTiniest
                                                            .copyWith(
                                                                color: AppColor
                                                                    .saasifyGreyBlue),
                                                      ),
                                                      const SizedBox(
                                                        width: spacingXXSmall,
                                                      ),
                                                      Text(
                                                        '******8578',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xTiniest
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: spacingXSmall,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Business Name:',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyGreyBlue)),
                                                      const SizedBox(
                                                        width: spacingXXSmall,
                                                      ),
                                                      Text(
                                                        'Maria Aniston',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xTiniest
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: spacingXSmall,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Phone:',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xTiniest
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .saasifyGreyBlue)),
                                                      const SizedBox(
                                                        width: spacingXXSmall,
                                                      ),
                                                      Text(
                                                        '+1 (065) 7865567',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .xTiniest
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ]))),
                            const SizedBox(
                              height: spacingMedium,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColor.saasifyWhite,
                                    borderRadius:
                                        BorderRadius.circular(kCircularRadius)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: spacingLarge,
                                        vertical: spacingLarge),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Products',
                                            style: Theme.of(context)
                                                .textTheme
                                                .tiniest
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: spacingXXSmall,
                                          ),
                                          const OrderDetailsListDataTable()
                                        ]))),
                          ])))
            ]));
  }
}
