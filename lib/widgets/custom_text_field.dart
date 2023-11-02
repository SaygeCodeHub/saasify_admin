import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onTextFieldChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic initialValue;
  final TextStyle? hintStyle;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.validator,
      this.suffix,
      this.initialValue,
      required this.onTextFieldChanged,
      this.prefixIcon,
      this.obscureText = false,
      this.hintStyle,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        suffix: suffix,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        counterText: "",
      ),
      validator: validator,
      onChanged: onTextFieldChanged,
    );
  }
}
