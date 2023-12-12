import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../purchase_order_textfield.dart';

class PurchaseOrderNotesSection extends StatelessWidget {
  const PurchaseOrderNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PurchaseOrderTextField(
          hintText: 'Notes',
          hintStyle: Theme.of(context).textTheme.xTiniest,
          onTextFieldChanged: (value) {},
        ),
        PurchaseOrderTextField(
            width: 400,
            hintText: 'It was great doing business with you.',
            hintStyle: Theme.of(context).textTheme.xTiniest,
            onTextFieldChanged: (value) {}),
        const SizedBox(height: 20),
        PurchaseOrderTextField(
            hintText: 'Terms & Conditions',
            hintStyle: Theme.of(context).textTheme.xTiniest,
            onTextFieldChanged: (value) {}),
        PurchaseOrderTextField(
            width: 700,
            hintText:
                'Upon accepting this purchase order, you hereby agree to the terms & conditions.',
            hintStyle: Theme.of(context).textTheme.xTiniest,
            onTextFieldChanged: (value) {}),
      ],
    );
  }
}
