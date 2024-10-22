import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../domain/dash_balance_history.dart';
import '../data/balance_history_data.dart';

import 'package:bankdash/theme/barrel.dart';

class BalanceHistory extends StatelessWidget {
  const BalanceHistory({super.key});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    final data = balanceHistoryData[value.toInt()];

    Widget text = Text(data.title, style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    return Text(
      '${value.toInt()}K',
      style: style,
      textAlign: TextAlign.left,
    );
  }

  mainData() {
    final maxAmount = balanceHistoryData.fold(
      0.0,
      (previousValue, element) =>
          previousValue > element.amount ? previousValue : element.amount,
    );

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.grayColor,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.grayColor,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: (maxAmount / 1000).toDouble() + 1,
      lineBarsData: [
        LineChartBarData(
          spots: balanceHistoryData
              .map((data) => FlSpot(
                    double.parse(data.id) - 1,
                    data.amount / 1000,
                  ))
              .toList(),
          isCurved: true,
          gradient: const LinearGradient(
            colors: [
              AppColors.blueColor,
              AppColors.grayColor,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                AppColors.blueColor,
                AppColors.lightGreenColor,
                AppColors.lightRedColor,
              ].map((color) => color.withOpacity(0.2)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Balance History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: LineChart(mainData())),
      ],
    );
  }
}
