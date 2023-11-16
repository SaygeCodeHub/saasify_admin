import 'package:flutter/material.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

typedef StringCallBack = Function(String textField);

class CustomDropdownWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool canEdit;
  final String dropdownValue;
  final List listItems;
  final Color? color;
  // final Map dataMap;
  // final String mapKey;
  final Widget? disabledHint;

  const CustomDropdownWidget({
    super.key,
    this.validator,
    required this.dropdownValue,
    this.initialValue,
    this.canEdit = true,
    required this.listItems,
    // required this.dataMap,
    // required this.mapKey,
    this.disabledHint,
    this.color,
  });

  @override
  DropdownScreenState createState() => DropdownScreenState();
}

class DropdownScreenState extends State<CustomDropdownWidget> {
  String? selectedValue;

  @override
  // void initState() {
  //   widget.dataMap[widget.mapKey] = widget.listItems[0];
  //   selectedValue = widget.listItems[0];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: kDropdownWidth,
        decoration: BoxDecoration(
          color: (widget.color == null)
              ? AppColor.saasifyLighterGrey
              : widget.color,
          border: Border.all(color: AppColor.saasifyWhite),
          borderRadius: BorderRadius.circular(spacingMedium),
        ),
        child: DropdownButtonHideUnderline(
            child: Padding(
                padding: const EdgeInsets.all(spacingSmall),
                child: DropdownButton(
                    disabledHint: const Text(""),
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
