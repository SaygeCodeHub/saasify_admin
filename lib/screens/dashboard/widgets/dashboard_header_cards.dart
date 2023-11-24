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
      'leading': "assets/card_image_one.PNG",
      'title': '34',
      'subtitle': 'Total Order',
      'trailing': null,
    },
    {
      'leading': "assets/card_image_two.PNG",
      'title': '12',
      'subtitle': 'Total Pending Order',
      'trailing': "33%",
    },
    {
      'leading': "assets/card_image_three.PNG",
      'title': '22',
      'subtitle': 'Total Dispatched',
      'trailing': "67%"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
                  leading: Image.asset(cardItems[index]['leading'].toString()),
                  title: Text(cardItems[index]['title'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .xTiny
                          .copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text(cardItems[index]['subtitle'].toString(),
                      style: Theme.of(context).textTheme.xTiniest),
                  trailing: (cardItems[index]['trailing'] == null)
                      ? null
                      : CircularPercentIndicator(
                          radius: 24.0,
                          lineWidth: 4.0,
                          animation: true,
                          percent: 0.8,
                          center: Text(cardItems[index]['trailing'].toString()),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.saasifyLightDeepBlue)),
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 4, crossAxisSpacing: 40),
    );
  }
}
