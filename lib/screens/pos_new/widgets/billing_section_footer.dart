import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/customer/customer_bloc.dart';
import 'package:saasify/bloc/customer/customer_event.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos_new/widgets/billing_section_header.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../bloc/customer/customer_state.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/billing/fetch_products_by_category_model.dart';
import '../../../widgets/primary_button.dart';
import 'payment_dialogue.dart';

class BillingSectionFooter extends StatelessWidget {
  final List<CategoryWithProductsDatum> productsByCategories;
  const BillingSectionFooter({super.key, required this.productsByCategories});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocListener<CustomerBloc, CustomerStates>(
  listener: (context, state) {
    if (state is CustomerFetched){
      log("stateEmitted");
      switch (state.action){
        case 'addToPayLater':
          context.read<BillingBloc>().add(AddOrderToPayLater());
        case 'settleBill':
          log("settleBill");
          context.read<BillingBloc>().add(SaveOrder(productsByCategories: productsByCategories));
          showDialog(
              context: context,
              builder: (context) => const PaymentDialogue());
        case 'gotCustomer':
          context.read<BillingBloc>().add(SaveOrder(productsByCategories: productsByCategories));
      }
    }
  },
  child: Center(
          child: InkWell(
              onTap: () {
                if (context.read<BillingBloc>().customer.customerName != '') {
                  context.read<BillingBloc>().add(AddOrderToPayLater());
                } else {
                  if (ContactTile.formKey.currentState!.validate()) {
                    context.read<CustomerBloc>().add(GetCustomer(
                        customerContact: context
                            .read<BillingBloc>()
                            .customer
                            .customerContact, action: 'addToPayLater'));
                  }
                }
              },
              child: Text(
                StringConstants.kPayLater,
                style: Theme.of(context).textTheme.tiniest.copyWith(
                      color: AppColor.saasifyGreyBlue,
                      decoration: TextDecoration.underline,
                    ),
              ))),
),
      const SizedBox(height: spacingMedium),
      PrimaryButton(
        onPressed: () {
          if (context.read<BillingBloc>().customer.customerName != '') {
            showDialog(
                context: context,
                builder: (context) => const PaymentDialogue());
          } else {
            if (ContactTile.formKey.currentState!.validate()) {
              context.read<CustomerBloc>().add(GetCustomer(
                  customerContact:
                      context.read<BillingBloc>().customer.customerContact, action: 'settleBill'));
            }
          }
        },
        buttonTitle: StringConstants.kSettleBill,
      )
    ]);
  }
}
