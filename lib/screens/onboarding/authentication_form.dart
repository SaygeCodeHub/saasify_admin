import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';
import '../../configs/app_color.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'auhentication_screen.dart';

class AuthenticationBody extends StatelessWidget {
  final bool isLogin;
  final bool passwordHidden;

  AuthenticationBody(
      {super.key, required this.isLogin, required this.passwordHidden});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: spacingXXXHuge, vertical: spacingXXXHuge),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome,",
                    style: Theme.of(context).textTheme.titleMedium),
                (isLogin == true)
                    ? Text('Login To Posify',
                        style: Theme.of(context).textTheme.titleSmall)
                    : Text('Sign Up to Posify',
                        style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: spacingSmall),
                const Text('Email'),
                const SizedBox(height: spacingStandard),
                CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'Please Enter a Valid Email';
                      }

                      return null;
                    },
                    initialValue: AuthenticationScreen
                        .AuthDetails['signUpCredentials'],
                    onTextFieldChanged: (value) {
                      AuthenticationScreen
                          .AuthDetails['signUpCredentials'] = value;
                    }),
                const SizedBox(height: spacingStandard),
                const Text('Password'),
                const SizedBox(height: spacingStandard),
                CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      } else if (!RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                          .hasMatch(value)) {
                        return 'Minimum eight characters, at least one letter, one number and one special character:';
                      }
                      return null;
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        context.read<AuthenticationBloc>().add(HidePassword(
                            isLogin: isLogin,
                            passwordHidden: passwordHidden));
                      },
                      child: (passwordHidden)
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    initialValue:
                        AuthenticationScreen.AuthDetails['password'],
                    obscureText: passwordHidden,
                    onTextFieldChanged: (value) {
                      AuthenticationScreen.AuthDetails['password'] = value;
                    }),
                const SizedBox(height: spacingStandard),
                PrimaryButton(
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (isLogin == true) {
                            context.read<AuthenticationBloc>().add(Login(
                                companyPassword: AuthenticationScreen
                                    .AuthDetails['company_password'],
                                loginCredentials: AuthenticationScreen
                                    .AuthDetails['signUpCredentials']));
                          } else {
                            context.read<AuthenticationBloc>().add(SignUp(
                                companyPassword: AuthenticationScreen
                                    .AuthDetails['company_password'],
                                signUpCredentials: AuthenticationScreen
                                    .AuthDetails['signUpCredentials'],
                                fullName: AuthenticationScreen
                                    .AuthDetails['full_name']));
                          }
                        }
                    },
                    textValue: (isLogin == true) ? 'Login' : 'Sign Up'),
                const SizedBox(height: spacingStandard),
                (isLogin == true)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            const Text('New Here ?'),
                            const SizedBox(width: spacingStandard),
                            InkWell(
                                onTap: () {
                                  context.read<AuthenticationBloc>().add(
                                      SwitchAuthentication(
                                          isLogin: isLogin,
                                          passwordHidden: passwordHidden));
                                },
                                child: Text('Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall))
                          ])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            const Text('Already Have an Account'),
                            const SizedBox(width: spacingStandard),
                            InkWell(
                                onTap: () {
                                  context.read<AuthenticationBloc>().add(
                                      SwitchAuthentication(
                                          isLogin: isLogin,
                                          passwordHidden: passwordHidden));
                                },
                                child: Text('Login.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColor.sassifyDeepBlue)))
                          ])
              ])),
    );
  }
}
