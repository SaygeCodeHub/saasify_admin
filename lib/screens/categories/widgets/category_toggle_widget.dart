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
        width: 70.0,
        height: 30.0,
        valueFontSize: 10.0,
        toggleSize: 30.0,
        value: widget.isActive,
        borderRadius: 30.0,
        padding: 8.0,
        showOnOff: false,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        });
  }
}
