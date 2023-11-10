// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:saasify/configs/app_theme.dart';
// import 'package:saasify/screens/pos/widgets/billing_section.dart';
// import 'package:saasify/screens/pos/widgets/billing_section_extended.dart';
// import 'package:saasify/screens/pos/widgets/products_with_categories.dart';
// import '../../bloc/pos/billing_bloc.dart';
// import '../../bloc/pos/billing_event.dart';
// import '../../bloc/pos/billing_state.dart';
// import '../../configs/app_color.dart';
// import '../../configs/app_spacing.dart';
// import '../../utils/database_util.dart';
//
// class BillingScreen extends StatelessWidget {
//   static const routeName = 'POSScreen';
//
//   const BillingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     context.read<BillingBloc>().add(LoadAllOrders());
//     return Container(
//         color: AppColor.saasifyWhite,
//         child: Column(children: [
//           BlocBuilder<BillingBloc, BillingStates>(builder: (context, state) {
//             if (state is FetchingProductsByCategory) {
//               return const Expanded(
//                   child: Center(child: CircularProgressIndicator()));
//             } else if (state is LoadDataBaseOrders) {
//               if (DatabaseUtil.ordersBox.isEmpty) {
//                 context.read<BillingBloc>().add(BillingInitialEvent(
//                     orderIndex: context.read<BillingBloc>().orderIndex));
//               }
//               return GridView.builder(
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 5),
//                   itemCount: state.customerIdList.length + 1,
//                   itemBuilder: (context, index) {
//                     if (state.customerIdList.length == index) {
//                       return Padding(
//                           padding: const EdgeInsets.all(spacingXLarge),
//                           child: InkWell(
//                               onTap: () {
//                                 context
//                                     .read<BillingBloc>()
//                                     .add(BillingInitialEvent(orderIndex: -1));
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                     color: AppColor.saasifyLightDeepBlue,
//                                     borderRadius:
//                                         BorderRadius.circular(spacingXMedium),
//                                   ),
//                                   child: Padding(
//                                       padding:
//                                           const EdgeInsets.all(spacingXHuge),
//                                       child: Center(
//                                           child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                             Text(
//                                               'Add Customer',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .tiniest
//                                                   .copyWith(
//                                                       color: AppColor
//                                                           .saasifyWhite),
//                                             ),
//                                             const SizedBox(
//                                                 height: spacingXMedium),
//                                             const Icon(Icons.add,
//                                                 size: double.maxFinite,
//                                                 color: AppColor.saasifyWhite)
//                                           ]))))));
//                     }
//                     return Padding(
//                         padding: const EdgeInsets.all(spacingXLarge),
//                         child: InkWell(
//                             onTap: () {
//                               context.read<BillingBloc>().orderIndex =
//                                   state.customerIdList[index];
//                               context.read<BillingBloc>().add(
//                                   BillingInitialEvent(
//                                       orderIndex: state.customerIdList[index]));
//                             },
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColor.saasifyLightDeepBlue,
//                                     borderRadius:
//                                         BorderRadius.circular(spacingXMedium)),
//                                 child: Padding(
//                                     padding:
//                                         const EdgeInsets.all(spacingXHuge),
//                                     child: Center(
//                                         child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                           Text(
//                                             'Customer no. - ${state.customerIdList[index]}',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .xxTiniest
//                                                 .copyWith(
//                                                     color:
//                                                         AppColor.saasifyWhite),
//                                           ),
//                                           const SizedBox(height: spacingXMedium),
//                                           Image.asset('assets/user.png',
//                                               height: 120)
//                                         ]))))));
//                   });
//             } else if (state is ProductsFetched) {
//               return Expanded(
//                   child: (context.read<BillingBloc>().billExpanded)
//                       ? BillingSectionExtended(
//                           selectedProducts: state.selectedProducts,
//                           productsByCategories: state.productsByCategories,
//                           billDetails: state.billDetails,
//                         )
//                       : Row(children: [
//                           Flexible(
//                               flex: 5,
//                               child: ProductsWithCategories(
//                                   productsByCategories:
//                                       state.productsByCategories)),
//                           (context
//                                   .read<BillingBloc>()
//                                   .selectedProducts
//                                   .isNotEmpty)
//                               ? Flexible(
//                                   flex: 2,
//                                   child: BillingSection(
//                                     selectedProducts: state.selectedProducts,
//                                     productsByCategories:
//                                         state.productsByCategories,
//                                     billDetails: state.billDetails,
//                                   ))
//                               : const SizedBox()
//                         ]));
//             } else {
//               return const SizedBox();
//             }
//           })
//         ]));
//   }
// }
