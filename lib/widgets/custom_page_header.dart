import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../data/models/pdf/invoice_customer.dart';

import '../services/pdf_service.dart';
import '../utils/constants/string_constants.dart';
import 'custom_text_field.dart';

class CustomPageHeader extends StatelessWidget {
  const CustomPageHeader(
      {super.key,
      required this.titleText,
      this.textFieldVisible = true,
      this.buttonVisible = false,
      this.onPressed,
      this.buttonTitle = '',
      this.onBack,
      this.backIconVisible = false,
      this.deleteIconVisible = false,
      this.deleteOnPressed,
      this.utilityVisible = false});

  final String titleText;
  final String buttonTitle;
  final bool textFieldVisible;
  final bool buttonVisible;
  final bool deleteIconVisible;
  final bool backIconVisible;
  final bool utilityVisible;
  final void Function()? onPressed;
  final void Function()? deleteOnPressed;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
          visible: backIconVisible,
          child: InkWell(
              onTap: onBack,
              child: context.responsive(const SizedBox(),
                  desktop: const Icon(Icons.arrow_back_ios_new)))),
      const SizedBox(width: spacingSmall),
      context.responsive(const SizedBox(),
          desktop: Text(titleText,
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w700))),
      context.responsive(const SizedBox(),
          desktop: const SizedBox(width: spacingStandard)),
      Expanded(
          flex: 5,
          child: Visibility(
              visible: textFieldVisible,
              child: CustomTextField(
                  hintText: StringConstants.kSearchHere,
                  onTextFieldChanged: (value) {}))),
      const Spacer(),
      Visibility(
          visible: utilityVisible,
          child: Row(children: [
            Visibility(
                visible: deleteIconVisible,
                child: IconButton(
                    onPressed: deleteOnPressed,
                    icon: const Icon(Icons.delete,
                        color: AppColor.saasifyRed, size: kHeaderIconsSize))),
            const SizedBox(width: spacingLarge),
            IconButton(
                icon: const Icon(Icons.share,
                    color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
                onPressed: () {}),
            const SizedBox(width: spacingLarge),
            IconButton(
              onPressed: () async {
                // final date = DateTime.now();
                // final dueDate = date.add(const Duration(days: 7));
                //
                // final invoice = Invoice(
                //   supplier: const Supplier(
                //     name: 'Sarah Field',
                //     address: 'Sarah Street 9, Beijing, China',
                //     paymentInfo: 'https://paypal.me/sarahfieldzz',
                //   ),
                //   invoiceCustomer: const InvoiceCustomer(
                //     name: 'Apple Inc.',
                //     address: 'Apple Street, Cupertino, CA 95014',
                //   ),
                //   info: InvoiceInfo(
                //     date: date,
                //     dueDate: dueDate,
                //     description: 'My description...',
                //     number: '${DateTime.now().year}-9999',
                //   ),
                //   items: [
                //     InvoiceItem(
                //       description: 'Coffee',
                //       date: DateTime.now(),
                //       quantity: 3,
                //       vat: 0.19,
                //       unitPrice: 5.99,
                //     ),
                //     InvoiceItem(
                //       description: 'Water',
                //       date: DateTime.now(),
                //       quantity: 8,
                //       vat: 0.19,
                //       unitPrice: 0.99,
                //     ),
                //     InvoiceItem(
                //       description: 'Orange',
                //       date: DateTime.now(),
                //       quantity: 3,
                //       vat: 0.19,
                //       unitPrice: 2.99,
                //     ),
                //     InvoiceItem(
                //       description: 'Apple',
                //       date: DateTime.now(),
                //       quantity: 8,
                //       vat: 0.19,
                //       unitPrice: 3.99,
                //     ),
                //     InvoiceItem(
                //       description: 'Mango',
                //       date: DateTime.now(),
                //       quantity: 1,
                //       vat: 0.19,
                //       unitPrice: 1.59,
                //     ),
                //     InvoiceItem(
                //       description: 'Blue Berries',
                //       date: DateTime.now(),
                //       quantity: 5,
                //       vat: 0.19,
                //       unitPrice: 0.99,
                //     ),
                //     InvoiceItem(
                //       description: 'Lemon',
                //       date: DateTime.now(),
                //       quantity: 4,
                //       vat: 0.19,
                //       unitPrice: 1.29,
                //     ),
                //   ],
                // );
// PdfService().print(list);
//                 final pdfFile = await PdfInvoiceApi.generate(invoice);
//
//                 PdfApi.openFile(pdfFile);
                PdfService().printCustomersPdf();
              },
              icon: const Icon(Icons.download,
                  color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
            ),
            const SizedBox(width: spacingLarge),
            IconButton(
                icon: const Icon(Icons.print,
                    color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
                onPressed: () {})
          ])),
      Visibility(
          visible: buttonVisible, child: const SizedBox(width: spacingLarge)),
      Visibility(
          visible: buttonVisible,
          child: PrimaryButton(
              buttonWidth: kGeneralActionButtonWidth,
              onPressed: onPressed,
              buttonTitle: buttonTitle)),
    ]);
  }
}
