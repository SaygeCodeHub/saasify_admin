import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

class PaymentDialogue extends StatefulWidget {
  const PaymentDialogue({super.key});

  @override
  State<PaymentDialogue> createState() => _PaymentDialogueState();
}

class _PaymentDialogueState extends State<PaymentDialogue> {
  List payments = ["Bank Card", "UPI", "Card", "Other"];
  String selectedPayment = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kGeneralRadius)),
        contentPadding: const EdgeInsets.all(spacingXHuge),
        content: SizedBox(
            height: kDialogueHeight,
            width: kDialogueWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(StringConstants.kPaymentMethods),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close))
              ]),
              const SizedBox(height: spacingStandard),
              Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.2),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(spacingXMedium),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPayment = payments[index];
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.saasifyCementGrey,
                                        borderRadius: BorderRadius.circular(
                                            spacingXMedium)),
                                    child:
                                        Center(child: Text(payments[index])))));
                      })),
              const SizedBox(height: spacingXMedium),
              PrimaryButton(onPressed: () {}, buttonTitle: StringConstants.kPay)
            ])));
  }
}
