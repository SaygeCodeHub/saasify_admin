import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.buttonTitle,
      required this.onPressed});
  final String title;
  final String message;
  final String buttonTitle;
  final void Function()? onPressed;

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
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w700)),
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                        onPressed: onPressed,
                        buttonWidth: spacingXXXHuge,
                        buttonTitle: buttonTitle),
                  )
                ])));
  }
}
