import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXXXHuge,
                    right: spacingXXXHuge,
                    top: spacingXXXXHuge),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo.jpg'),
                      Text(StringConstants.kHello,
                          style: Theme.of(context)
                              .textTheme
                              .xxTiny
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: kHelloSpacingHeight),
                      Text(StringConstants.kEmailAddress,
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: spacingMedium),
                      CustomTextField(
                          hintText: StringConstants.kWhatsYourEmail,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.text,
                          onTextFieldChanged: (value) {}),
                      const SizedBox(height: spacingXXHuge),
                      Text(StringConstants.kPassword,
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: spacingMedium),
                      CustomTextField(
                          suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                          hintText: StringConstants.kChoosePassword,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.text,
                          onTextFieldChanged: (value) {}),
                      const SizedBox(height: spacingXXHuge),
                      PrimaryButton(
                        onPressed: () {},
                        buttonWidth: double.maxFinite,
                        buttonTitle: 'SignUp',
                      ),
                      const SizedBox(height: spacingXXLarge),
                      Row(
                        children: [
                          Text(StringConstants.kHaveAnAccountYet,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(width: 4),
                          TextButton(
                              onPressed: () {},
                              child: Text(StringConstants.kLogin,
                                  style: Theme.of(context)
                                      .textTheme
                                      .tiniest
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.saasifyDarkBlue)))
                        ],
                      )
                    ]),
              ))),
      Expanded(
          flex: 6,
          child: Container(
            color: AppColor.saasifyLightDeepBlue,
          ))
    ]);
  }
}
