import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/categories/categories_event.dart';
import 'package:saasify/configs/app_color.dart';

import '../../../bloc/categories/categories_event.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';

class CategoryToggleWidget extends StatelessWidget {
  final ProductCategory productCategory;

  const CategoryToggleWidget({super.key, required this.productCategory});

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
