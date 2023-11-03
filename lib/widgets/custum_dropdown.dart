import 'package:flutter/material.dart';
import '../configs/app_color.dart';
import '../configs/app_spacing.dart';

typedef StringCallBack = Function(String textField);

class CustomDropdownWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool canEdit;
  final String dropdownValue;
  final List listItems;

  // final Map dataMap;
  // final String mapKey;

  const CustomDropdownWidget({
    super.key,
    this.validator,
    required this.dropdownValue,
    this.initialValue,
    this.canEdit = true,
    required this.listItems,
    //Will need this code when we will implement APIs
    // required this.dataMap,
    // required this.mapKey,
  });

  @override
  DropdownScreenState createState() => DropdownScreenState();
}

class DropdownScreenState extends State<CustomDropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    // widget.dataMap[widget.mapKey] = widget.listItems[0];
    selectedValue = widget.listItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        decoration: BoxDecoration(
          color: AppColor.saasifyLightestGrey,
          border: Border.all(color: AppColor.saasifyLightestGrey),
          borderRadius: BorderRadius.circular(spacingSmall),
        ),
        child: DropdownButtonHideUnderline(
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton(
                    underline: const SizedBox(),
                    value: selectedValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: List.generate(
                        widget.listItems.length,
                        (index) => DropdownMenuItem(
                            value: widget.listItems[index],
                            child: Text(widget.listItems[index]))),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                      });
                      // widget.dataMap[widget.mapKey] = value;
                    }))));
  }
}
