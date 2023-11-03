import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(
                left: spacingXXXHuge,
                right: spacingXXXHuge,
                top: spacingXXXHuge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/SaaSify.svg",
                      height: kGeneralButtonHeight, width: kLogoWidth),
                  const SizedBox(height: spacingXXHuge),
                  Text(StringConstants.kEnterOtp,
                      style: Theme.of(context)
                          .textTheme
                          .xxTiny
                          .copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: kHelloSpacingHeight),
                  Text(StringConstants.kOtp,
                      style: Theme.of(context)
                          .textTheme
                          .tiniest
                          .copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: spacingMedium),
                  const Pinput(
                    length: 6,
                  ),
                  const SizedBox(height: spacingXXHuge),
                  PrimaryButton(
                    onPressed: () {},
                    buttonWidth: double.maxFinite,
                    buttonTitle: 'Verify Otp',
                  ),
                  const SizedBox(height: spacingXXLarge),
                ]),
          ),
        ),
      ],
    );
  }
}
