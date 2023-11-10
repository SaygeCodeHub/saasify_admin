import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../bloc/pos/billing_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(spacingXHuge),
      content: SizedBox(
        height: 450,
        width: 370,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close))
            ]),
            const Text('Payment Methods'),
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
                                      color:
                                          (selectedPayment == payments[index])
                                              ? AppColor.saasifyLightDeepBlue
                                              : AppColor.saasifyGreen,
                                      borderRadius: BorderRadius.circular(
                                          spacingXMedium)),
                                  child:
                                      Center(child: Text(payments[index])))));
                    })),
            const SizedBox(height: spacingStandard),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<BillingBloc>()
                      .add(SettleOrder(paymentMethod: selectedPayment));
                  Navigator.pop(context);
                },
                child: const Text('Done'))
          ],
        ),
      ),
    );
  }
}
