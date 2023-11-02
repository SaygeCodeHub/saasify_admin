import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/onboarding/authentication_form.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_states.dart';
import '../../configs/app_color.dart';
import '../../utils/progress_bar.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';
  static Map signUpDetails = {};

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: AppColor.sassifyWhite,
            body: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
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
              return curr is SwitchLoginScreen;
            }, builder: (context, state) {
              if (state is SwitchLoginScreen) {
                return AuthenticationForm();
              } else {
                return const SizedBox();
              }
            })));
  }
}
