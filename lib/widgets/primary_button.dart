import 'package:flutter/material.dart';
import '../configs/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final double buttonWidth;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final BorderSide? side;
  final String buttonTitle;
  final IconData? icon;

  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.buttonWidth,
      this.style,
      this.backgroundColor,
      this.side,
      required this.buttonTitle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.sassifyGrey,
        minimumSize: Size(buttonWidth, 50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (icon == null) ? const SizedBox.shrink() : Icon(icon),
          Text(buttonTitle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
