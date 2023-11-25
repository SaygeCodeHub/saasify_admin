import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/configs/app_color.dart';

import '../../../bloc/categories/categories_event.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';

class CategoryToggleWidget extends StatelessWidget {
  final ProductCategory productCategory;

  const CategoryToggleWidget({super.key, required this.productCategory});

  @override
  Widget build(BuildContext context) {
    Map editCategoryMap = productCategory.toJson();
    return FlutterSwitch(
        activeColor: AppColor.saasifyLightDeepBlue,
        inactiveColor: AppColor.saasifyPaleBlack,
        width: 70.0,
        height: 35.0,
        valueFontSize: 10.0,
        toggleSize: 40.0,
        value: productCategory.isActive,
        borderRadius: 30.0,
        padding: 4.0,
        showOnOff: false,
        onToggle: (val) {
          log('hereeeeeeeeeeeeeeeeeeee$val');
          editCategoryMap['is_active'] = val;
          context
              .read<CategoriesBloc>()
              .add(EditCategories(categoryDetailsMap: editCategoryMap));
        });
  }
}
