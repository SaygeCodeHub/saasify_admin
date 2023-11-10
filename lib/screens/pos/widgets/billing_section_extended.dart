import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../bloc/pos/billing_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/billing/selected_product_model.dart';
import '../../../data/models/billing/bill_model.dart';
import '../../../data/models/billing/fetch_products_by_category_model.dart';

class BillingSectionExtended extends StatelessWidget {
  final List<SelectedProductModel> selectedProducts;
  final List<CategoryWithProductsDatum> productsByCategories;
  final BillModel billDetails;

  const BillingSectionExtended({
    super.key,
    required this.selectedProducts,
    required this.productsByCategories,
    required this.billDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingHuge),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spacingXMedium),
          color: AppColor.saasifyWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(spacingLarge),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        context.read<BillingBloc>().add(ExpandBilling(
                            productsByCategories: productsByCategories));
                      },
                      child: Image.asset('assets/minimize.png'))
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Order no. - 9999999999'),
                            const Text('Contact - 000'),
                            const SizedBox(height: spacingSmall),
                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(spacingXMedium)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: spacingLarger,
                                    vertical: spacingStandard),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('View Coupons/Membership'),
                                    Icon(Icons.arrow_forward_ios,
                                        size: spacingMedium)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: spacingSmall),
                            const Padding(
                              padding: EdgeInsets.only(left: spacingLarger),
                              child: Text('Your Order'),
                            ),
                            ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 200,
                                ),
                                child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Table(
                                        columnWidths: const {
                                          0: FlexColumnWidth(0.5),
                                          1: FlexColumnWidth(2)
                                        },
                                        children: List.generate(
                                            selectedProducts.length,
                                            (index) => TableRow(children: [
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                              spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration: const BoxDecoration(
                                                              color: AppColor
                                                                  .saasifyLightGrey,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          spacingXMedium),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          spacingXMedium))),
                                                          child: Center(
                                                            child: Image.network(
                                                                selectedProducts[
                                                                        index]
                                                                    .product
                                                                    .variants[
                                                                        index]
                                                                    .image[0],
                                                                fit: BoxFit
                                                                    .fitHeight),
                                                          ))),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                              spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .saasifyLightGrey),
                                                          child: Center(
                                                            child: Text(
                                                                '₹${selectedProducts[index].product.productName}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ))),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                              spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .saasifyLightGrey),
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    context.read<BillingBloc>().add(RemoveProduct(
                                                                        product:
                                                                            selectedProducts[index]
                                                                                .product,
                                                                        productsByCategories:
                                                                            productsByCategories));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 22,
                                                                    width: 22,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.lightBlue),
                                                                    ),
                                                                    child: const Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .remove,
                                                                            size:
                                                                                12)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 22,
                                                                  width: 22,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .lightBlue),
                                                                  ),
                                                                  child: Center(
                                                                      child: Text(
                                                                          selectedProducts[index]
                                                                              .count
                                                                              .toString(),
                                                                          style: const TextStyle(
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.w700))),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    context.read<BillingBloc>().add(SelectProduct(
                                                                        product:
                                                                            selectedProducts[index]
                                                                                .product,
                                                                        productsByCategories:
                                                                            productsByCategories,
                                                                        variantIndex:
                                                                            0));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 22,
                                                                    width: 22,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.lightBlue),
                                                                    ),
                                                                    child: const Center(
                                                                        child: Icon(
                                                                      Icons.add,
                                                                      size: 12,
                                                                      weight:
                                                                          700,
                                                                    )),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ))),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                              spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .saasifyLightGrey),
                                                          child: Center(
                                                            child: Text(
                                                                '₹${selectedProducts[index].product.variants[index].discountedCost.toStringAsFixed(2)}'),
                                                          ))),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                              spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .saasifyLightGrey),
                                                          child: Center(
                                                            child: Text(
                                                                '₹${(selectedProducts[index].product.variants[index].discountedCost - selectedProducts[index].product.variants[index].discountedCost).toStringAsFixed(2)}'),
                                                          ))),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical:
                                                                  spacingXXSmall),
                                                      child: Container(
                                                          height:
                                                              kGeneralButtonHeight,
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical:
                                                                  spacingXSmall),
                                                          decoration: const BoxDecoration(
                                                              color: AppColor
                                                                  .saasifyLightGrey,
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(
                                                                      spacingXMedium),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          spacingXMedium))),
                                                          child: Center(
                                                              child: Center(
                                                                  child:
                                                                      Text('₹${selectedProducts[index].product.variants[index].discountedCost.toStringAsFixed(2)}'))))),
                                                ])))))
                          ]))),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(spacingXMedium)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: spacingLarger, vertical: spacingStandard),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bill Details',
                          style: Theme.of(context).textTheme.tiniest),
                      const SizedBox(height: spacingXXSmall),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Item Total',
                              style: TextStyle(
                                  color: AppColor.saasifyLighterGrey)),
                          Text('₹${billDetails.itemTotal.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(
                                      color: AppColor.saasifyLighterGrey)),
                        ],
                      ),
                      const Divider(color: AppColor.saasifyLighterGrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('GST',
                              style: TextStyle(
                                  color: AppColor.saasifyLighterGrey)),
                          Text('₹${billDetails.gSTCharges.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiniest
                                  .copyWith(
                                      color: AppColor.saasifyLighterGrey)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Additional Charges',
                            style: Theme.of(context)
                                .textTheme
                                .tiniest
                                .copyWith(color: AppColor.saasifyLighterGrey),
                          ),
                          Text(
                              '₹${billDetails.additionalCharges.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(
                                      color: AppColor.saasifyLighterGrey)),
                        ],
                      ),
                      const Divider(color: AppColor.saasifyLighterGrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('To Pay'),
                          Text('₹${billDetails.total.toStringAsFixed(2)}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: Text(
                'Pay Later',
                style: Theme.of(context).textTheme.tiniest.copyWith(
                    color: AppColor.saasifyLighterGrey,
                    decoration: TextDecoration.underline),
              )),
              const SizedBox(height: spacingXMedium),
              Row(
                children: [
                  Flexible(
                      child: Center(
                          child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Total '),
                      Text(
                        '₹${billDetails.total.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .tiniest
                            .copyWith(fontSize: 17),
                      ),
                    ],
                  ))),
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Settle Bill'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
