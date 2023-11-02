import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../bloc/authentication/authentication_bloc.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/header_widget.dart';

class AuthenticationForm extends StatelessWidget {
  AuthenticationForm({super.key, required this.signUpDetails});

  final Map signUpDetails;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HeaderWidget(isFromSignUp: true),
      const SizedBox(height: spacingStandard),
      Expanded(
          child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Form(
              key: formKey,
              child: Expanded(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.only(left: spacingLarge,right: spacingLarge,top: spacingLarge),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          ]))),
            ),
            Expanded(
                flex: 6,
                child: (context.read<AuthenticationBloc>().isLogin == true)
                    ? SvgPicture.asset('assets/login.svg', fit: BoxFit.cover)
                    : SvgPicture.asset('assets/sign_up.svg',
                    fit: BoxFit.contain))
          ]))
    ]);
  }
}
