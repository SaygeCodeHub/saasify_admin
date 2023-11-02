import 'package:flutter/material.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_color.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class AuthenticationForm extends StatelessWidget {
  AuthenticationForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 4,
          child: Form(
              key: formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/logo.jpg'),
                    const Text(StringConstants.kHello),
                    const Text(StringConstants.kEmailAddress),
                    CustomTextField(
                        hintText: StringConstants.kWhatsYourEmail,
                        keyboardType: TextInputType.text,
                        onTextFieldChanged: (value) {}),
                    PrimaryButton(
                      onPressed: () {},
                      buttonWidth: double.maxFinite,
                      buttonTitle: 'SignUp',
                    ),
                    const Text(StringConstants.kPassword),
                    CustomTextField(
                        hintText: StringConstants.kChoosePassword,
                        keyboardType: TextInputType.text,
                        onTextFieldChanged: (value) {}),
                    PrimaryButton(
                      onPressed: () {},
                      buttonWidth: double.maxFinite,
                      buttonTitle: 'SignUp',
                    ),
                    const Row(
                      children: [
                        Text(StringConstants.kHaveAnAccountYet),
                        Text(StringConstants.kLogin),
                      ],
                    )
                  ]))),
      Expanded(
          flex: 6,
          child: Container(
            color: AppColor.saasifyLightDeepBlue,
          ))
    ]);
  }
}
