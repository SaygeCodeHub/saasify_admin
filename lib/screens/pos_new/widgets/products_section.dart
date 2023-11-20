import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/screens/pos_new/widgets/product_grid.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key, required this.posData});

  final List<CategoryWithProductsDatum> posData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: spacingLarger,
            bottom: spacingHuge,
            right: spacingLarger,
            left: spacingXXLarge),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColor.saasifyCementGrey,
                        border: Border.all(color: AppColor.saasifyWhite),
                        borderRadius: BorderRadius.circular(spacingMedium),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isDense: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              borderRadius: BorderRadius.circular(12),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              value: posData[context
                                      .read<BillingBloc>()
                                      .selectedCategoryIndex]
                                  .categoryName,
                              items: List.generate(
                                  posData
                                      .map((e) => e.categoryName)
                                      .toList()
                                      .length,
                                  (index) => DropdownMenuItem(
                                      value: posData
                                          .map((e) => e.categoryName)
                                          .toList()[index],
                                      child: Text(posData
                                          .map((e) => e.categoryName)
                                          .toList()[index]))),
                              onChanged: (value) {
                                context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex =
                                    posData
                                        .map((e) => e.categoryName)
                                        .toList()
                                        .indexOf(value!);
                                context.read<BillingBloc>().add(SelectCategory(
                                    productsByCategories: posData));
                              })))),
              const SizedBox(width: kGeneralButtonHeight),
              Expanded(
                flex: context.read<BillingBloc>().selectedProducts.isNotEmpty
                    ? 3
                    : 5,
                child: CustomTextField(
                    hintText: StringConstants.kSearchProduct,
                    onTextFieldChanged: (value) {}),
              )
            ],
          ),
          const SizedBox(height: spacingLarger),
          Row(
              children: List.generate(posData.length, (index) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<BillingBloc>().selectedCategoryIndex = index;
                    context
                        .read<BillingBloc>()
                        .add(SelectCategory(productsByCategories: posData));
                  },
                  child: Text(posData[index].categoryName,
                      style: Theme.of(context).textTheme.xxTiniest.copyWith(
                          color: (index ==
                                  context
                                      .read<BillingBloc>()
                                      .selectedCategoryIndex)
                              ? AppColor.saasifyRed
                              : AppColor.saasifyBlack,
                          decoration: (index ==
                                  context
                                      .read<BillingBloc>()
                                      .selectedCategoryIndex)
                              ? TextDecoration.underline
                              : TextDecoration.none)),
                ),
                const SizedBox(width: spacingHuge),
              ],
            );
          })),
          const Divider(),
          const SizedBox(height: kGeneralButtonHeight),
          ProductGrid(posData: posData)
        ]));
  }
}
