import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_spacing.dart';
import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../widgets/header_widget.dart';

class AuthenticationForm extends StatelessWidget {
  AuthenticationForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HeaderWidget(isFromSignUp: true),
      const SizedBox(height: spacingMedium),
      Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 4,
            child: Form(
              key: formKey,
              child: const Padding(
                  padding:
                      EdgeInsets.only(left: spacingMedium, top: spacingMedium),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [])),
            )),
        Expanded(
            flex: 6,
            child: (context.read<AuthenticationBloc>().isLogin == true)
                ? SvgPicture.asset('assets/login.svg', fit: BoxFit.cover)
                : SvgPicture.asset('assets/sign_up.svg', fit: BoxFit.contain))
      ]))
    ]);
  }
}
