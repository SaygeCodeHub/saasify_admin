import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/screens/authentication/widgets/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/widgets/auth_web_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context
        .read<AuthenticationBloc>()
        .add(SwitchAuthentication(isLogin: false, focusField: ''));
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return (constraints.maxWidth < 600)
                ? const AuthMobileScreen()
                : const AuthWebScreen();
          }),
        ));
  }
}
