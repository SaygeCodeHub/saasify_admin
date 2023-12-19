import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../widgets/field_label_widget.dart';
import '../../widgets/primary_button.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';

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
          body: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.07),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/saasify_logo.svg",
                              width: 50, height: 50),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).width * 0.035),
                          LabelAndFieldWidget(label: StringConstants.kLoginId),
                          LabelAndFieldWidget(label: StringConstants.kPassword),
                          PrimaryButton(
                              onPressed: () {},
                              buttonTitle: StringConstants.kVerify)
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
