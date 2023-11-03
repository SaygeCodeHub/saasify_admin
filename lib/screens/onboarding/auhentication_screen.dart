import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/onboarding/authentication_form.dart';
import 'package:saasify/screens/onboarding/otp_screen.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_states.dart';
import '../../configs/app_color.dart';
import '../../utils/progress_bar.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';
  static Map authDetails = {};

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: AppColor.saasifyWhite,
            body: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
                      listener: (context, state) {
                    if (state is OtpLoading) {
                      ProgressBar.show(context);
                    }
                    if (state is PhoneOtpVerified) {
                      ProgressBar.dismiss(context);
                      log('Done Hai');
                    }
                    if (state is PhoneAuthError) {
                      ProgressBar.dismiss(context);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  }, builder: (context, state) {
                    if (state is AuthenticationFormLoaded) {
                      return AuthenticationBody(isLogin: state.isLogin);
                    } else if (state is OtpReceived) {
                      ProgressBar.dismiss(context);
                      return OtpScreen(
                        verificationId: state.verificationId,
                        userName: state.userName,
                      );
                    }
                    return const SizedBox();
                  }),
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      color: AppColor.saasifyLightDeepBlue,
                    ))
              ],
            )));
  }
}
