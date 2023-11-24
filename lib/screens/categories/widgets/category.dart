import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
    return Scaffold(
        body: Expanded(
            child: FlutterSwitch(
                activeColor: Colors.green,
                width: 125.0,
                height: 55.0,
                valueFontSize: 25.0,
                toggleSize: 45.0,
                value: widget.isActive,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                })));
  }
}
