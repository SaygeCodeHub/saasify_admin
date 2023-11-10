import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class BillingProductTileBody extends StatelessWidget {
  const BillingProductTileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                child: Text(
              "Cake",
              maxLines: 2,
              style: TextStyle(),
            )),
            const SizedBox(width: 38),
            Text('₹ 425',
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.saasifyLightDeepBlue))
          ],
        ),
      ),
      Text("400gm",
          style: Theme.of(context)
              .textTheme
              .xTiniest
              .copyWith(color: AppColor.saasifyGrey)),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
              ),
              child: const Center(child: Icon(Icons.remove, size: 12)),
            ),
          ),
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue),
            ),
            child: Center(
                child: Text("5", style: Theme.of(context).textTheme.xxTiniest)),
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.saasifyLighterGrey),
                  ),
                  child: const Center(
                      child: Icon(Icons.add,
                          size: spacingXMedium, weight: kAlertBoxWidth))))
        ])
      ])
    ]);
  }
}
