import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.primaryButtonTitle,
      required this.checkMarkVisible,
      required this.crossIconVisible,
      required this.secondaryOnPressed,
      this.secondaryButtonTitle,
      required this.primaryOnPressed,
      required this.sizedBoxVisible});

  final String title;
  final String message;
  final String primaryButtonTitle;
  final String? secondaryButtonTitle;
  final void Function()? secondaryOnPressed;
  final void Function()? primaryOnPressed;
  final bool checkMarkVisible;
  final bool crossIconVisible;
  final bool sizedBoxVisible;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kAlertBoxWidth,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Visibility(
                              visible: checkMarkVisible,
                              child: const Icon(Icons.check_circle_rounded,
                                  color: AppColor.saasifyGreen)),
                          Visibility(
                              visible: sizedBoxVisible,
                              child: const SizedBox(width: spacingXXSmall)),
                          Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w700))
                        ]),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Visibility(
                                visible: crossIconVisible,
                                child: const Icon(Icons.close,
                                    color: AppColor.saasifyGrey)))
                      ]),
                  const SizedBox(height: spacingXLarge),
                  Text(message, style: Theme.of(context).textTheme.xxTiniest),
                  const SizedBox(height: spacingXLarge),
                  Row(
                    children: [
                      const Spacer(flex: 2),
                      Expanded(
                        child: (secondaryButtonTitle == null)
                            ? const SizedBox.shrink()
                            : SecondaryButton(
                                side: const BorderSide(
                                    color: AppColor.saasifyLightWhite),
                                onPressed: secondaryOnPressed,
                                buttonTitle: secondaryButtonTitle ?? ''),
                      ),
                      const SizedBox(width: spacingStandard),
                      Expanded(
                        child: PrimaryButton(
                            onPressed: primaryOnPressed,
                            buttonWidth: spacingXXXHuge,
                            buttonTitle: primaryButtonTitle),
                      ),
                    ],
                  )
                ])));
  }
}
