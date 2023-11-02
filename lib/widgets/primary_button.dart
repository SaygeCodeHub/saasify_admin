import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textValue;

  const PrimaryButton(
      {Key? key, required this.onPressed, required this.textValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColor.sassifyDeepBlue),
        child: Text(textValue));
  }
}
