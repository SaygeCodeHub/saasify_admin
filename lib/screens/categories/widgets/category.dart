import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool status = false;

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
          value: status,
          borderRadius: 30.0,
          padding: 8.0,
          showOnOff: true,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ),
    );
  }
}
