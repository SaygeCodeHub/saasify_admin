import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos_new/payment_dialogue.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../bloc/pos/billing_bloc.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/billing/fetch_products_by_category_model.dart';

class VariantDialogue extends StatelessWidget {
  const VariantDialogue({
    super.key,
    required this.posData,
  });

  final List<CategoryWithProductsDatum> posData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacingXMedium)),
        contentPadding: const EdgeInsets.all(spacingXHuge),
        content: SizedBox(
            height: kDialogueWidth,
            width: kDialogueWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(StringConstants.kChooseVariant,
                    style: Theme.of(context).textTheme.tiniest),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close))
              ]),
              const SizedBox(height: spacingXLarge),
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.2),
                          itemCount: posData[context
                                  .read<BillingBloc>()
                                  .selectedCategoryIndex]
                              .products
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(spacingXMedium),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const PaymentDialogue());
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.saasifyCementGrey,
                                          borderRadius: BorderRadius.circular(
                                              spacingXMedium)),
                                      child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Text(
                                                posData[context
                                                        .read<BillingBloc>()
                                                        .selectedCategoryIndex]
                                                    .products[index]
                                                    .variants[index]
                                                    .quantity
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        color: AppColor
                                                            .saasifyWhite)),
                                            const SizedBox(
                                                width: spacingXSmall),
                                            Text(
                                                posData[context
                                                        .read<BillingBloc>()
                                                        .selectedCategoryIndex]
                                                    .products[index]
                                                    .variants[index]
                                                    .unit
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        color: AppColor
                                                            .saasifyWhite)),
                                          ]))),
                                ));
                          })))
            ])));
  }
}
