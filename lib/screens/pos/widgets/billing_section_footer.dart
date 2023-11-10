import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos/widgets/payment_dialogue.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../bloc/pos/billing_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BillingSectionFooter extends StatelessWidget {
  const BillingSectionFooter({super.key});

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
                      color: AppColor.saasifyLighterGrey,
                      decoration: TextDecoration.underline,
                    ),
              ))),
      const SizedBox(height: spacingXMedium),
      Row(children: [
        Flexible(
            child: Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
              const Text('Total '),
              Text('₹ 1104', style: Theme.of(context).textTheme.tiniest)
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
