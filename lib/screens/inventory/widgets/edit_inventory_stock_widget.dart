import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';

class EditInventoryStock extends StatelessWidget {
  const EditInventoryStock({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: 300,
            height: 100,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringConstants.kUpdateStock,
                      style: Theme.of(context).textTheme.xxTiniest),
                  const SizedBox(height: 20),
                  CustomTextField(inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], onTextFieldChanged: (value) {})
                ])));
  }
}
