import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/primary_button.dart';
import '../../pos_new/payment_dialogue.dart';

class BillingSectionFooterTwo extends StatelessWidget {
  const BillingSectionFooterTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: InkWell(
              onTap: () {},
              child: Text(
                StringConstants.kPayLater,
                style: Theme.of(context).textTheme.tiniest.copyWith(
                      color: AppColor.saasifyGreyBlue,
                      decoration: TextDecoration.underline,
                    ),
              ))),
      const SizedBox(height: spacingXXSmall),
      PrimaryButton(
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const PaymentDialogue());
        },
        buttonTitle: StringConstants.kSettleBill,
      )
    ]);
  }
}
