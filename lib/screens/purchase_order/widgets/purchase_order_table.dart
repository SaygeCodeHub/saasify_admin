import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';
import 'package:saasify/configs/app_theme.dart';
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
    int itemCount = 3;
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
                      width: 150,
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
                      width: 150,
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
                    itemCount: itemCount,
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                        children: [
                          PurchaseOrderTextField(
                              width: 250,
                              hintText: 'Enter Item Name/Description',
                              hintStyle: Theme.of(context).textTheme.xTiniest,
                              onTextFieldChanged: (value) {}),
                          const SizedBox(width: 24),
                          PurchaseOrderTextField(
                              width: 150,
                              hintText: '5',
                              hintStyle: Theme.of(context).textTheme.xTiniest,
                              onTextFieldChanged: (value) {}),
                          const SizedBox(width: 24),
                          PurchaseOrderTextField(
                              width: 150,
                              hintText: '20',
                              hintStyle: Theme.of(context).textTheme.xTiniest,
                              onTextFieldChanged: (value) {}),
                          const SizedBox(width: 24),
                          PurchaseOrderTextField(
                              width: 150,
                              hintText: '250',
                              hintStyle: Theme.of(context).textTheme.xTiniest,
                              onTextFieldChanged: (value) {}),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider())),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(left: spacingSmall),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  InkWell(
                      onTap: () {
                        itemCount++;
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
                                hintText: "Sub Total",
                                hintStyle: Theme.of(context).textTheme.xTiniest,
                                onTextFieldChanged: (value) {},
                              ),
                              const SizedBox(width: spacingLarge),
                              Text("200.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .xTiniest
                                      .copyWith(fontWeight: FontWeight.w600))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            PurchaseOrderTextField(
                              hintText: "GST(10%)",
                              hintStyle: Theme.of(context).textTheme.xTiniest,
                              onTextFieldChanged: (value) {},
                            ),
                            const SizedBox(width: spacingLarge),
                            Text("20.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(fontWeight: FontWeight.w600))
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                            color: AppColor.saasifyGrey,
                            height: 40,
                            width: 300,
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
                                      Text("220.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .xTiniest
                                              .copyWith(
                                                  fontWeight: FontWeight.w600))
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
