import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/primary_button.dart';
import '../../pos/widgets/payment_dialogue.dart';

class BillingSectionFooterTwo extends StatelessWidget {
  const BillingSectionFooterTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Center(
          child: InkWell(
              onTap: () {},
              child: Text(
                'Pay Later',
                style: Theme.of(context).textTheme.tiniest.copyWith(
                      color: AppColor.saasifyGreyBlue,
                      decoration: TextDecoration.underline,
                    ),
              ))),
      const SizedBox(height: spacingSmall),
      PrimaryButton(
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const PaymentDialogue());
        },
        buttonTitle: 'Settle Bill',
      )
    ]));
  }
}
