import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/screens/product/widgets/product_form_image_section.dart';
import 'package:saasify/screens/product/widgets/product_form_section1.dart';
import 'package:saasify/screens/product/widgets/product_form_section2.dart';
import 'package:saasify/screens/product/widgets/product_form_section3.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.isVariant,
    required this.isEdit,
    required this.dataMap,
    required this.categoryList,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final List<ProductCategory> categoryList;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ProductListScreen.routeName);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            Text(
                (isVariant == true)
                    ? StringConstants.kAddVariant
                    : (isEdit)
                        ? 'Edit Product'
                        : StringConstants.kAddProduct,
                style: Theme.of(context)
                    .textTheme
                    .xxTiny
                    .copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
        const SizedBox(height: spacingXHuge),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductFormSection1(
              isVariant: isVariant,
              isEdit: isEdit,
              dataMap: dataMap,
              categoryList: categoryList),
          const SizedBox(width: spacingXXHuge),
          ProductFormSection2(
              isVariant: isVariant, isEdit: isEdit, dataMap: dataMap),
          const SizedBox(width: spacingXXHuge),
          ProductFormSection3(
              isVariant: isVariant, isEdit: isEdit, dataMap: dataMap)
        ]),
        const SizedBox(height: spacingHuge),
        FormImageSection(isEdit: isEdit, dataMap: dataMap),
        const SizedBox(height: spacingMedium),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SecondaryButton(
              onPressed: () {
                dataMap['draft'] = true;
                if (_formKey.currentState!.validate()) {
                  if (context.read<UploadBloc>().displayImageList.isNotEmpty) {
                    if (context.read<UploadBloc>().pickedImageList.isNotEmpty) {
                      context.read<UploadBloc>().add(UploadImage(
                          multiplePartFileList:
                              context.read<UploadBloc>().pickedFiles));
                    } else {
                      if (isEdit) {
                        context
                            .read<ProductBloc>()
                            .add(EditProduct(productDetailsMap: dataMap));
                      } else {
                        context
                            .read<ProductBloc>()
                            .add(SaveProduct(productDetailsMap: dataMap));
                      }
                    }
                  } else {
                    context.read<UploadBloc>().add(NoImageSelected());
                  }
                }
              },
              buttonWidth: spacingXXXXHuge,
              buttonTitle: StringConstants.kSave),
          const SizedBox(width: spacingLarge),
          PrimaryButton(
              onPressed: () {
                dataMap['draft'] = false;
                if (_formKey.currentState!.validate()) {
                  if (context.read<UploadBloc>().displayImageList.isNotEmpty) {
                    if (context.read<UploadBloc>().pickedImageList.isNotEmpty) {
                      context.read<UploadBloc>().add(UploadImage(
                          multiplePartFileList:
                              context.read<UploadBloc>().pickedFiles));
                    } else {
                      if (isEdit) {
                        context
                            .read<ProductBloc>()
                            .add(EditProduct(productDetailsMap: dataMap));
                      } else {
                        context
                            .read<ProductBloc>()
                            .add(SaveProduct(productDetailsMap: dataMap));
                      }
                    }
                  } else {
                    context.read<UploadBloc>().add(NoImageSelected());
                  }
                }
              },
              buttonWidth: spacingXXXXHuge,
              buttonTitle: StringConstants.kPublish),
        ]),
        const SizedBox(height: spacingMedium)
      ]),
    );
  }
}
