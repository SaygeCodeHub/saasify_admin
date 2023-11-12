import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/screens/pos/widgets/payment_dialogue.dart';

class BillingSectionFooter extends StatelessWidget {
  const BillingSectionFooter(
      {super.key, required this.selectedProducts, required this.billDetails});

  final List<SelectedProductModel> selectedProducts;
  final BillModel billDetails;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: InkWell(
              onTap: () {
                context.read<BillingBloc>().add(AddOrderToPayLater());
              },
              child: Text(
                'Pay Later',
                style: Theme.of(context).textTheme.tiniest.copyWith(
                      color: AppColor.saasifyGreyBlue,
                      decoration: TextDecoration.underline,
                    ),
              ))),
      const SizedBox(height: spacingStandard),
      Row(children: [
        Flexible(
            child: Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
              const Text('Total '),
              Text('₹${billDetails.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.tinier)
            ]))),
        Flexible(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const PaymentDialogue());
                },
                child: const Text('Settle Bill')))
      ])
    ]);
  }
}
