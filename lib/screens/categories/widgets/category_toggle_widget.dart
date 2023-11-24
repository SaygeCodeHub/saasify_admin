import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/categories/categories_event.dart';
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
    return Switch(
        activeColor: AppColor.saasifyLightDeepBlue,
        value: status,
        onChanged: (bool value) {
          context
              .read<CategoriesBloc>()
              .add(EditCategories(categoryDetailsMap: {}));
          setState(() {
            status = value;
          });
        });
  }
}
