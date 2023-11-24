import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:saasify/configs/app_color.dart';

class CategoryToggleWidget extends StatefulWidget {
  final bool isActive;

  const CategoryToggleWidget({super.key, required this.isActive});

  @override
  State<CategoryToggleWidget> createState() => _CategoryToggleWidgetState();
}

class _CategoryToggleWidgetState extends State<CategoryToggleWidget> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        activeColor: AppColor.saasifyLightDeepBlue,
        inactiveColor: AppColor.saasifyPaleBlack,
        width: 70.0,
        height: 35.0,
        valueFontSize: 10.0,
        toggleSize: 40.0,
        value: status,
        borderRadius: 30.0,
        padding: 4.0,
        showOnOff: false,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        });
  }
}
