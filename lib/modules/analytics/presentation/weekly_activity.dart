import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:bankdash/theme/barrel.dart';
import '../data/weekly_spends_data.dart';

final barGroups = weeklySpendsData.map((e) {
  return BarChartGroupData(
    x: e.date.weekday - 1,
    barRods: [
      BarChartRodData(
        toY: e.depositAmout.toDouble() / 1000,
        width: 10,
        color: AppColors.lightGreenColor,
      ),
      BarChartRodData(
        toY: e.withdrawalAmount.toDouble() / 1000,
        width: 10,
        color: AppColors.lightRedColor,
      ),
    ],
  );
}).toList();

class WeeklyActivity extends StatelessWidget {
  const WeeklyActivity({super.key});

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value % 2 == 0) {
      text = '${value.toInt()}K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Weekly Activity",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BarChart(
            BarChartData(
              maxY: 6,
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 42,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: 1,
                    getTitlesWidget: leftTitles,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: AppColors.grayColor.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
              ),
              barGroups: barGroups,
            ),
          ),
        ),
      ],
    );
  }
}
