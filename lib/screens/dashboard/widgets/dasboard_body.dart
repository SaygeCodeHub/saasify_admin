import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/dashboard/widgets/dashboard_order_table_list.dart';
import 'package:saasify/utils/dashboard_card.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../configs/app_spacing.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kCircularRadius)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacingMedium, right: spacingXLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: spacingXSmall,
                                horizontal: spacingStandard),
                            child: Text('Order Count',
                                style: Theme.of(context)
                                    .textTheme
                                    .tinier
                                    .copyWith(fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(height: spacingStandard),
                          const Expanded(child: DashboardChart()),
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: spacingStandard),
              Expanded(child: DashboardOrderTableList(ordersData: ordersData)),
            ],
          )),
      const SizedBox(width: spacingLarge),
      Expanded(
          child: Column(children: [
        Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: const Padding(
              padding: EdgeInsets.only(
                  left: spacingSmall,
                  right: spacingSmall,
                  bottom: spacingSmall),
              child: DashboardCalendar(),
            )),
        const SizedBox(height: spacingStandard),
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: Padding(
              padding: const EdgeInsets.all(spacingSmall),
              child: ListView.builder(
                  itemCount: dashboardOptionList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    index = index;
                    return ListTile(
                        onTap: () {
                          (dashboardOptionList[index].routeName == '')
                              ? null
                              : Navigator.pushReplacementNamed(context,
                                  dashboardOptionList[index].routeName);
                        },
                        titleAlignment: ListTileTitleAlignment.titleHeight,
                        tileColor: AppColor.saasifyWhite,
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: dashboardOptionList[index].iconColor),
                            child: Icon(dashboardOptionList[index].iconName,
                                color:
                                    dashboardOptionList[index].containerColor)),
                        title: Padding(
                            padding: const EdgeInsets.only(
                                left: spacingXSmall, top: spacingStandard),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      dashboardOptionList[index]
                                          .title
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                      textScaleFactor:
                                          context.responsive(0.63, desktop: 1)),
                                  const SizedBox(height: spacingXSmall),
                                  Text(
                                      dashboardOptionList[index]
                                          .subtitle
                                          .toString(),
                                      textScaleFactor:
                                          context.responsive(0.63, desktop: 1),
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest
                                          .copyWith(
                                              fontWeight: FontWeight.w500))
                                ])));
                  }),
            ),
          ),
        )
      ]))
    ]);
  }
}

class DashboardChart extends StatelessWidget {
  const DashboardChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weeks = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
      child: BarChart(BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          borderData: FlBorderData(border: Border.all(width: 0)),
          maxY: 10,
          // gridData: FlGridData(drawVerticalLine: false),
          titlesData: FlTitlesData(
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.all(spacingSmall),
                        child: Text(weeks[value.toInt()],
                            style: Theme.of(context)
                                .textTheme
                                .xxTiniest
                                .copyWith(
                                    color: AppColor.saasifyLightPaleGrey)),
                      );
                    }),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.all(spacingSmall),
                        child: Text(meta.formattedValue.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .xxTiniest
                                .copyWith(
                                    color: AppColor.saasifyLightPaleGrey)),
                      );
                    }),
              )),
          barGroups: List.generate(
              7,
              (index) => BarChartGroupData(x: index, barRods: [
                    BarChartRodData(
                        borderRadius: BorderRadius.circular(8),
                        fromY: 0,
                        toY: (Random().nextDouble() * 10).round().toDouble(),
                        width: 40,
                        color: (index % 2 == 0)
                            ? AppColor.saasifyCementGrey
                            : AppColor.saasifyLightDeepBlue)
                  ])))),
    );
  }
}

class DashboardCalendar extends StatefulWidget {
  const DashboardCalendar({
    super.key,
  });

  @override
  State<DashboardCalendar> createState() => _DashboardCalendarState();
}

class _DashboardCalendarState extends State<DashboardCalendar> {
  DateTime _focusDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: (selectedDate, event) {
        setState(() {
          _focusDay = selectedDate;
        });
      },
      selectedDayPredicate: (selectedDate) {
        return selectedDate == _focusDay;
      },
      focusedDay: _focusDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {CalendarFormat.week: 'Week'},
    );
  }
}
