import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

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
            'Lychee Cake',
            maxLines: 2,
            style: TextStyle(),
          )),
          Text('₹425',
              style: Theme.of(context)
                  .textTheme
                  .tiniest
                  .copyWith(color: AppColor.saasifyLightDeepBlue))
        ],
      ),
      Text('300 gms',
          style: Theme.of(context)
              .textTheme
              .xTiniest
              .copyWith(color: AppColor.saasifyGrey)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Add Instructions',
            style: Theme.of(context)
                .textTheme
                .xTiniest
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
              child: const Center(child: Icon(Icons.remove)),
            ),
          ),
          Container(
            height: kCounterContainerSize,
            width: kCounterContainerSize,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.saasifyLightDeepBlue),
            ),
            child: Center(
                child: Text('1', style: Theme.of(context).textTheme.tiniest)),
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  height: kCounterContainerSize,
                  width: kCounterContainerSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.saasifyLightDeepBlue),
                  ),
                  child: const Center(child: Icon(Icons.add))))
        ])
      ])
    ]);
  }
}
