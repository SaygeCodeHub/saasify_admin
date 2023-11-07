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
      required this.secondaryOnPressed,
      this.secondaryButtonTitle,
      required this.primaryOnPressed});

  final String title;
  final String message;
  final String primaryButtonTitle;
  final String? secondaryButtonTitle;
  final void Function()? secondaryOnPressed;
  final void Function()? primaryOnPressed;
  final bool checkMarkVisible;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Visibility(
                          visible: true,
                          child: Icon(Icons.check_circle_rounded,
                              color: AppColor.saasifyGreen)),
                      const SizedBox(width: spacingXXSmall),
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(width: kIconDistanceWidth),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColor.saasifyGrey,
                          )),
                    ],
                  ),
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
