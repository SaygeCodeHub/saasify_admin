import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

class VariantDialogue extends StatelessWidget {
  const VariantDialogue({
    super.key,
  });

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
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(spacingXMedium),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.saasifyCementGrey,
                                        borderRadius: BorderRadius.circular(
                                            spacingXMedium)),
                                    child: const Center(
                                        child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(StringConstants.k300gms,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .saasifyWhite)),
                                                ])))));
                          })))
            ])));
  }
}
