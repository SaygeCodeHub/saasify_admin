import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../configs/app_spacing.dart';

class DashboardHeaderCards extends StatelessWidget {
  DashboardHeaderCards({super.key});

  final List cardItems = [
    {
      // 'leading': null,
      'leading': "assets/card_image_one.PNG",
      'title': 'Total Order',
      'subtitle': '34',
      'trailing': null,
    },
    {
      'leading': "assets/card_image_two.PNG",
      // 'leading': null,
      'title': 'Total Earning',
      'subtitle': '12',
      'trailing': null,
    },
    {
      'leading': "assets/card_image_three.PNG",
      // 'leading': "null",
      'title': 'Unpaid Orders',
      'subtitle': '22',
      'trailing': "67%"
    },
    {'leading': null, 'title': 'Cash', 'subtitle': '22', 'trailing': null},
    {'leading': null, 'title': 'UPI', 'subtitle': '55', 'trailing': null},
    {'leading': null, 'title': 'Bank Card', 'subtitle': '76', 'trailing': null},
    {'leading': null, 'title': 'Other', 'subtitle': '80', 'trailing': null},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
              height: spacingStandard,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCircularRadius),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.saasifyLightPaleGrey,
                    blurRadius: 5.0,
                  )
                ],
                color: AppColor.saasifyWhite,
              ),
              child: Center(
                child: ListTile(
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    tileColor: AppColor.saasifyWhite,
                    leading: (cardItems[index]['leading'] == null)
                        ? null
                        : Image.asset(cardItems[index]['leading'].toString()),
                    title: Text(cardItems[index]['title'].toString(),
                        style: Theme.of(context).textTheme.xxTiniest),
                    subtitle: Text(cardItems[index]['subtitle'].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .xTiny
                            .copyWith(fontWeight: FontWeight.w700)),
                    trailing: (cardItems[index]['trailing'] == null)
                        ? null
                        : CircularPercentIndicator(
                            radius: spacingXLarge,
                            lineWidth: spacingXSmall,
                            animation: true,
                            percent: kPercent,
                            center:
                                Text(cardItems[index]['trailing'].toString()),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: AppColor.saasifyLightDeepBlue)),
              )),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 45 / 19,
          crossAxisSpacing: spacingLarge),
    );
  }
}
