import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/pos_new/variant_dialogue.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 172 / 146),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(spacingXSmall),
              child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const VariantDialogue());
                  },
                  child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(spacingXXSmall),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(spacingXMedium),
                        color: AppColor.saasifyLighterGrey,
                      ),
                      child: Column(children: [
                        const Row(),
                        SizedBox(
                          height: kButtonHeight,
                          child: Image.asset(
                            'assets/cake_img.png',
                          ),
                        ),
                        const SizedBox(height: spacingXMedium),
                        Center(
                            child: Text(StringConstants.kLycheeCake,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.xxTiniest,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2)),
                        const SizedBox(height: spacingXXSmall),
                        Text(StringConstants.k425,
                            style: Theme.of(context)
                                .textTheme
                                .tiniest
                                .copyWith(color: AppColor.saasifyLightDeepBlue))
                      ]))));
        });
  }
}
