import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';

class BillingProductTileBodyTwo extends StatelessWidget {
  const BillingProductTileBodyTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
              child: Text(
            StringConstants.kLycheeCake,
            maxLines: 2,
            style: TextStyle(),
          )),
          Text(StringConstants.k425,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(color: AppColor.saasifyLightDeepBlue))
        ],
      ),
      Text(StringConstants.k300gms,
          style: Theme.of(context)
              .textTheme
              .xxxTiniest
              .copyWith(color: AppColor.saasifyGrey)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(StringConstants.kAddInstructions,
            style: Theme.of(context)
                .textTheme
                .xxxTiniest
                .copyWith(color: AppColor.saasifyLightDeepBlue)),
        Row(children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: kCounterContainerSize,
              width: kCounterContainerSize,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.saasifyLightDeepBlue),
              ),
              child: const Center(
                  child: Icon(
                Icons.remove,
                size: kGeneralRadius,
              )),
            ),
          ),
          Container(
            height: kCounterContainerSize,
            width: kCounterContainerSize,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.saasifyLightDeepBlue),
            ),
            child: Center(
                child: Text(StringConstants.k1,
                    style: Theme.of(context).textTheme.xxTiniest)),
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  height: kCounterContainerSize,
                  width: kCounterContainerSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.saasifyLightDeepBlue),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    size: kGeneralRadius,
                  ))))
        ])
      ])
    ]);
  }
}
