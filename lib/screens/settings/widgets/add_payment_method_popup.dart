import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/payment/payments_bloc.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../../../widgets/toggle_switch_widget.dart';

class AddNewPaymentTypePopup extends StatelessWidget {
  const AddNewPaymentTypePopup({super.key});
  static Map savePaymentDetailsMap = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kDialogueWidth,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstants.kAddNewPaymentMethod,
                          style: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child:
                                Icon(Icons.close, color: AppColor.saasifyGrey),
                          )),
                    ],
                  ),
                  const SizedBox(height: spacingMedium),
                  CustomTextField(onTextFieldChanged: (value) {
                    savePaymentDetailsMap['payment_name'] = value;
                  }),
                  const SizedBox(height: spacingSmall),
                  Row(
                    children: [
                      Text(StringConstants.kDoYouWantToDeactivateBranch,
                          style: Theme.of(context).textTheme.xTiniest),
                      ToggleSwitchWidget(
                          value: true,
                          onChanged: (value) {
                            savePaymentDetailsMap['is_active'] = value;
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: spacingXMedium,
                  ),
                  Row(children: [
                    Expanded(
                        child: SecondaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            buttonTitle: StringConstants.kCancel)),
                    const SizedBox(
                      width: spacingXXSmall,
                    ),
                    Expanded(
                        child: PrimaryButton(
                            onPressed: () {
                              context.read<PaymentBloc>().add(SavePayment(
                                  paymentDetailsMap: savePaymentDetailsMap));
                            },
                            buttonTitle: StringConstants.kAdd))
                  ])
                ])));
  }
}
