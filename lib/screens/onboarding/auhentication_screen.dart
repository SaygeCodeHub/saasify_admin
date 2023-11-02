import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/screens/onboarding/authentication_form.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/header_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';
  static Map AuthDetails = {};

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: AppColor.sassifyWhite,
            body: Column(
              children: [
                const HeaderWidget(isFromSignUp: true),
                const SizedBox(height: spacingMedium),
                Expanded(
                  child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
                      listener: (context, state) {
                    if (state is SignUpLoading || state is LoggingIn) {
                      ProgressBar.show(context);
                    } else if (state is SignUpLoaded || state is LoggedIn) {
                      ProgressBar.dismiss(context);
                      // Navigator.pushNamed(context, CompanyDetailsScreen.routeName);
                    } else if (state is SignUpError) {
                      ProgressBar.dismiss(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                    } else if (state is LoginError) {
                      ProgressBar.dismiss(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                    }
                  }, buildWhen: (prev, curr) {
                    return curr is LoadAuthenticationForm;
                  }, builder: (context, state) {
                    if (state is LoadAuthenticationForm) {
                      log('screen loaded');
                      return Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: AuthenticationBody(
                                isLogin: state.isLogin,
                                passwordHidden: state.passwordHidden),
                          ),
                          Expanded(
                              flex: 5,
                              child: (state.isLogin)
                                  ? SvgPicture.asset('assets/login.svg',
                                      fit: BoxFit.cover)
                                  : SvgPicture.asset('assets/sign_up.svg',
                                      fit: BoxFit.contain))
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
              ],
            )));
  }
}
