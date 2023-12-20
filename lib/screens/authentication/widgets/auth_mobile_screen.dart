import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/screens/authentication/widgets/verify_button.dart';
import '../../../configs/spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/field_label_widget.dart';

class AuthMobileScreen extends StatelessWidget {
  const AuthMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(mobileBodyPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                SvgPicture.asset("assets/saasify_logo.svg",
                    width: 50, height: 50),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
                const LabelAndFieldWidget(label: StringConstants.kLoginId),
                const SizedBox(height: spacingBetweenTextFields),
                const LabelAndFieldWidget(
                    label: StringConstants.kPassword, obscureText: true),
                const SizedBox(height: spacingBetweenTextFieldAndButton),
                const AuthVerifyButton()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
