import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/purchase_order/calculate_model.dart';
import '../../../bloc/purchaseorder/purchase_order_bloc.dart';
import '../../../bloc/purchaseorder/purchase_order_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../purchase_order_textfield.dart';

class PurchaseOrderTable extends StatelessWidget {
  const PurchaseOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PurchaseOrderBloc>().add(LoadPurchaseOrder());
    return BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
      builder: (context, state) {
        if (state is PurchaseOrderLoaded) {
          return Column(children: [
            Container(
                height: spacingExcel,
                color: AppColor.saasifyDarkGrey,
                child: Row(children: [
                  PurchaseOrderTextField(
                      color: AppColor.saasifyDarkGrey,
                      fillColor: AppColor.saasifyDarkGrey,
                      borderSide:
                          const BorderSide(color: AppColor.saasifyBlack),
                      hintText: StringConstants.kItemDescription,
                      hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: AppColor.saasifyWhite,
                          fontWeight: FontWeight.w600),
                      width: 250,
                      onTextFieldChanged: (value) {}),
                  const SizedBox(width: 24),
                  PurchaseOrderTextField(
                      width: 150,
                      color: AppColor.saasifyDarkGrey,
                      fillColor: AppColor.saasifyDarkGrey,
                      borderSide:
                          const BorderSide(color: AppColor.saasifyBlack),
                      hintText: StringConstants.kQty,
                      hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: AppColor.saasifyWhite,
                          fontWeight: FontWeight.w600),
                      onTextFieldChanged: (value) {}),
                  const SizedBox(width: 24),
                  PurchaseOrderTextField(
                      width: 190,
                      color: AppColor.saasifyDarkGrey,
                      fillColor: AppColor.saasifyDarkGrey,
                      borderSide:
                          const BorderSide(color: AppColor.saasifyBlack),
                      hintText: StringConstants.kRate,
                      hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: AppColor.saasifyWhite,
                          fontWeight: FontWeight.w600),
                      onTextFieldChanged: (value) {}),
                  const SizedBox(width: 24),
                  PurchaseOrderTextField(
                      width: 100,
                      color: AppColor.saasifyDarkGrey,
                      fillColor: AppColor.saasifyDarkGrey,
                      borderSide:
                          const BorderSide(color: AppColor.saasifyBlack),
                      hintText: StringConstants.kAmount,
                      hintStyle: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: AppColor.saasifyWhite,
                          fontWeight: FontWeight.w600),
                      onTextFieldChanged: (value) {})
                ])),
            const SizedBox(height: spacingSmall),
            ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 500),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.purchaseOrderList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Row(children: [
                        PurchaseOrderTextField(
                            width: 250,
                            hintText: 'Enter Item Name/Description',
                            hintStyle: Theme.of(context).textTheme.xTiniest,
                            onTextFieldChanged: (value) {}),
                        const SizedBox(width: 24),
                        PurchaseOrderTextField(
                            width: 150,
                            initialValue: state
                                .purchaseOrderList[index].quantity
                                .toString(),
                            hintStyle: Theme.of(context).textTheme.xTiniest,
                            onEditingComplete: (value) {
                              context
                                  .read<PurchaseOrderBloc>()
                                  .add(LoadPurchaseOrder());
                            },
                            onTextFieldChanged: (value) {
                              context
                                  .read<PurchaseOrderBloc>()
                                  .purchaseOrderList[index]
                                  .quantity = int.parse(value);
                            }),
                        const SizedBox(width: 24),
                        PurchaseOrderTextField(
                            width: 200,
                            initialValue:
                                state.purchaseOrderList[index].rate.toString(),
                            hintStyle: Theme.of(context).textTheme.xTiniest,
                            onEditingComplete: (value) {
                              context
                                  .read<PurchaseOrderBloc>()
                                  .add(LoadPurchaseOrder());
                            },
                            onTextFieldChanged: (value) {
                              context
                                  .read<PurchaseOrderBloc>()
                                  .purchaseOrderList[index]
                                  .rate = double.parse(value);
                            }),
                        const SizedBox(width: 24),
                        PurchaseOrderTextField(
                            readOnly: true,
                            width: 100,
                            initialValue:
                                (state.purchaseOrderList[index].quantity *
                                        state.purchaseOrderList[index].rate)
                                    .toString(),
                            hintStyle: Theme.of(context).textTheme.xTiniest,
                            onTextFieldChanged: (value) {})
                      ]);
                    },
                    separatorBuilder: (context, index) => const Divider())),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(left: spacingSmall),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  InkWell(
                      onTap: () {
                        context.read<PurchaseOrderBloc>().purchaseOrderList.add(
                            PurchaseOrderModel(
                                amount: 0, quantity: 0, rate: 0));
                        context
                            .read<PurchaseOrderBloc>()
                            .add(LoadPurchaseOrder());
                      },
                      child: const Row(children: [
                        Icon(Icons.add_circle, color: AppColor.saasifyGreen),
                        SizedBox(width: spacingSmall),
                        Text("Add Line Item")
                      ])),
                  const SizedBox(width: 260),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PurchaseOrderTextField(
                                width: 268,
                                hintText: "Sub Total",
                                hintStyle: Theme.of(context).textTheme.xTiniest,
                                onTextFieldChanged: (value) {},
                              ),
                              const SizedBox(width: spacingLarge),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    context
                                        .read<PurchaseOrderBloc>()
                                        .calculate
                                        .subTotal
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .xTiniest
                                        .copyWith(fontWeight: FontWeight.w600)),
                              )
                            ]),
                        const SizedBox(height: 16),
                        Row(children: [
                          const Text("GST (%)"),
                          PurchaseOrderTextField(
                            width: 215,
                            initialValue: context
                                .read<PurchaseOrderBloc>()
                                .calculate
                                .gstPercent,
                            hintStyle: Theme.of(context).textTheme.xTiniest,
                            onTextFieldChanged: (value) {
                              context
                                  .read<PurchaseOrderBloc>()
                                  .calculate
                                  .gstPercent = double.parse(value);
                              context
                                  .read<PurchaseOrderBloc>()
                                  .add(LoadPurchaseOrder());
                            },
                          ),
                          const SizedBox(width: spacingLarge),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  context
                                      .read<PurchaseOrderBloc>()
                                      .calculate
                                      .gst
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .xTiniest
                                      .copyWith(fontWeight: FontWeight.w600)))
                        ]),
                        const SizedBox(height: 16),
                        Container(
                            color: AppColor.saasifyGrey,
                            height: 40,
                            width: 308,
                            child: Padding(
                                padding: const EdgeInsets.all(spacingSmall),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: Theme.of(context)
                                              .textTheme
                                              .xTiniest),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            context
                                                .read<PurchaseOrderBloc>()
                                                .calculate
                                                .total
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .xTiniest
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    ])))
                      ])
                ]))
          ]);
        }
        return const SizedBox();
      },
    );
  }
}
