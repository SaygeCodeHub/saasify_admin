import 'package:flutter/material.dart';
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
            height: 400,
            width: 370,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Choose Variant'),
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
                                                  Text("200 gm",
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
