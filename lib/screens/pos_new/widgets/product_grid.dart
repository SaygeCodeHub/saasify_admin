import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/screens/pos_new/widgets/variant_dialogue.dart';
import '../../../bloc/pos/billing_bloc.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.posData,
  });

  final List<CategoryWithProductsDatum> posData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: posData[context.read<BillingBloc>().selectedCategoryIndex]
            .products
            .length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                context.read<BillingBloc>().selectedProducts.isNotEmpty ? 5 : 7,
            childAspectRatio: 172 / 146),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(spacingXSmall),
              child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => VariantDialogue(
                            posData: posData, productIndex: index));
                  },
                  child: Container(
                      height: spacingXXXXHuge,
                      padding: const EdgeInsets.all(spacingXXSmall),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(spacingXMedium),
                        color: AppColor.saasifyLighterGrey,
                      ),
                      child: Column(children: [
                        const Row(),
                        const SizedBox(height: spacingXMedium),
                        Center(
                            child: Text(
                                posData[context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex]
                                    .products[index]
                                    .productName,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.xxTiniest,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2)),
                        const SizedBox(height: spacingXXSmall),
                        Text(
                            posData[context
                                    .read<BillingBloc>()
                                    .selectedCategoryIndex]
                                .products[index]
                                .brandName
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .tiniest
                                .copyWith(color: AppColor.saasifyLightDeepBlue))
                      ]))));
        });
  }
}
