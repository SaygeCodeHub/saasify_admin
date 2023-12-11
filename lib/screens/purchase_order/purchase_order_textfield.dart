// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:saasify/configs/app_color.dart';
//
// class CustomTextField extends StatelessWidget {
//   // final int? maxLines;
//   // final TextInputAction? textInputAction;
//   // final int? maxLength;
//   // final String? hintText;
//   // final String? getText;
//   // final bool? firstCall;
//   // final void Function(String)? onTextFieldChanged;
//   // final bool? readOnly;
//   // final bool? enabled;
//   // final TextEditingController controller = TextEditingController();
//   // final bool obscureText;
//   // final String? Function(String?)? validator;
//   // final Widget? suffix;
//   // final Widget? prefixIcon;
//   // final Widget? suffixIcon;
//   // final bool autofocus;
//   // final dynamic initialValue;
//   // final TextInputType? keyboardType;
//   // final List<TextInputFormatter>? inputFormatters;
//   // final EdgeInsetsGeometry? contentPadding;
//   // final TextStyle? hintStyle;
//
//   CustomTextField(
//       {Key? key,
//         // this.maxLines,
//         // this.textInputAction,
//         // this.maxLength,
//         // this.hintText,
//         // this.getText,
//         // this.firstCall,
//         // this.readOnly = false,
//         // this.validator,
//         // this.suffix,
//         // this.initialValue,
//         // this.keyboardType,
//         // this.contentPadding,
//         // required this.onTextFieldChanged,
//         // this.inputFormatters,
//         // this.prefixIcon,
//         // this.obscureText = false,
//         // this.hintStyle,
//         // this.suffixIcon,
//         // this.autofocus = false,
//         // this.enabled
//   })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // initialValue == null ? null : controller.text = initialValue.toString();
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: TextField(
//         focusNode: _focusNode,
//         decoration: InputDecoration(
//           hintText: 'Enter text',
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//       // key: key,
//       // enabled: enabled,
//       //
//       // autofocus: autofocus,
//       // obscureText: obscureText,
//       // obscuringCharacter: "*",
//       // cursorColor: AppColor.saasifyLightDeepBlue,
//       // decoration: InputDecoration(
//       //   suffix: suffix,
//       //   hintText: hintText,
//       //   hintStyle: hintStyle,
//       //   prefixIcon: prefixIcon,
//       //   suffixIcon: suffixIcon,
//       //   counterText: "",
//       // ),
//       // inputFormatters: inputFormatters,
//       // validator: validator,
//       // readOnly: readOnly!,
//       // controller: controller,
//       // onChanged: onTextFieldChanged,
//       // textInputAction: textInputAction,
//       // maxLines: maxLines ?? 1,
//       // maxLength: maxLength,
//       // keyboardType: keyboardType,
//       // textAlign: TextAlign.start,
//     // );
//   }
// }
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';

import '../../configs/app_spacing.dart';

class PurchaseOrderTextField extends StatelessWidget {
  final GlobalKey<FormFieldState<String>> _formKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  final String? hintText;
  final TextStyle? hintStyle;
  final dynamic initialValue;
  final double? width;
  final bool readOnly;
  final void Function(String)? onTextFieldChanged;
  final TextEditingController controller = TextEditingController();

  PurchaseOrderTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.initialValue,
    required this.onTextFieldChanged,
    this.width,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    initialValue == null ? null : controller.text = initialValue.toString();

    return Container(
      width: (width == null) ? 200 : width,
      color: AppColor.saasifyWhite,
      child: TextFormField(
        key: _formKey,
        focusNode: _focusNode,
        controller: controller,
        onChanged: onTextFieldChanged,
        readOnly: readOnly,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(spacingStandard),
            hintText: hintText,
            hintStyle: hintStyle,
            fillColor: AppColor.saasifyWhite,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.saasifyDarkerGrey))),
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
      ),
    );
  }
}
