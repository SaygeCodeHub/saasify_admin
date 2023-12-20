import 'package:flutter/material.dart';

import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class AuthVerifyButton extends StatelessWidget {
  const AuthVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onPressed: () {}, buttonTitle: StringConstants.kVerify);
  }
}
