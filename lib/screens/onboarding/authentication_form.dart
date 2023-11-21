import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class AuthenticationBody extends StatelessWidget {
  final String focusField;
  final bool isLogin;

  AuthenticationBody({
    super.key,
    required this.isLogin,
    required this.focusField,
  });

  final _formKey = GlobalKey<FormState>();

  bool _checkIfNullOrEmpty(String? value) {
    if (value == null || value == '' || value.trim() == '') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.only(
                left: spacingXXXHuge,
                right: spacingXXXHuge,
                top: spacingXXXHuge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/SaaSify.svg", width: kLogoWidth),
                  const SizedBox(height: spacingXXXHuge),
                  (isLogin)
                      ? Text(StringConstants.kWelcome,
                          style: Theme.of(context).textTheme.xxTiny.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.saasifyDarkBlack))
                      : Text(StringConstants.kHello,
                          style: Theme.of(context)
                              .textTheme
                              .xxTiny
                              .copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: kHelloSpacingHeight),
                  Visibility(
                      visible: !isLogin,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringConstants.kName,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingMedium),
                            CustomTextField(
                                autofocus: focusField == 'user_name',
                                initialValue: AuthenticationScreen
                                    .authDetails['user_name'],
                                hintText: StringConstants.kWhatsYourName,
                                keyboardType: TextInputType.text,
                                onTextFieldChanged: (value) {
                                  context.read<AuthenticationBloc>().add(
                                      TextFieldChange(
                                          isLogin: isLogin,
                                          focusField: 'user_name'));
                                  AuthenticationScreen
                                      .authDetails['user_name'] = value;
                                }),
                            const SizedBox(height: spacingXXHuge),
                          ])),
                  Text(StringConstants.kContactNumber,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.saasifyLightBlack)),
                  const SizedBox(height: spacingXMedium),
                  CustomTextField(
                      autofocus: focusField == 'user_contact',
                      initialValue:
                          AuthenticationScreen.authDetails['user_contact'],
                      hintText: StringConstants.kAddYourContactNumber,
                      validator: (value) {
                        if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(value!)) {
                          return StringConstants.kPleaseAddAValidContact;
                        }
                        return null;
                      },
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onTextFieldChanged: (value) {
                        context.read<AuthenticationBloc>().add(TextFieldChange(
                            isLogin: isLogin, focusField: 'user_contact'));
                        AuthenticationScreen.authDetails['user_contact'] =
                            value;
                      }),
                  const SizedBox(height: spacingXXHuge),
                  PrimaryButton(
                    onPressed: (((!isLogin)
                                ? _checkIfNullOrEmpty(AuthenticationScreen
                                    .authDetails['user_name'])
                                : true) &&
                            _checkIfNullOrEmpty(AuthenticationScreen
                                .authDetails['user_contact']))
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthenticationBloc>().add(GetOtp(
                                  userName: AuthenticationScreen
                                          .authDetails['user_name'] ??
                                      "",
                                  phoneNo:
                                      "+91 ${AuthenticationScreen.authDetails['user_contact']}"));
                            }
                          }
                        : null,
                    buttonWidth: double.maxFinite,
                    buttonTitle: (isLogin) ? 'Login' : 'SignUp',
                  )
                ])));
  }
}
