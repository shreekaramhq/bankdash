import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

final years = ['2017', '2018', '2019', '2020', '2021'];

class MonthlyRevenue extends StatelessWidget {
  const MonthlyRevenue({super.key});

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 30,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    if (value.toInt() == 0) {
      return Container();
    }

    return Text("\$${value.toInt()}k",
        style: style, textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      angle: -45,
      child: Text(years[value.toInt()], style: style),
    );
  }

  LineChartBarData get lineBarsData => LineChartBarData(
        isCurved: true,
        color: Colors.green.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0.5),
          FlSpot(0.5, 1),
          FlSpot(1, 4),
          FlSpot(1.2, 3),
          FlSpot(1.5, 2),
          FlSpot(2, 1.8),
          FlSpot(2.9, 1.8),
          FlSpot(3, 3.5),
          FlSpot(3.4, 2),
          FlSpot(4, 2),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Revenue",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: LineChart(
                LineChartData(
                  lineTouchData: lineTouchData1,
                  titlesData: titlesData1,
                  gridData: const FlGridData(
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [lineBarsData],
                  minX: 0,
                  maxX: 4,
                  maxY: 4,
                  minY: 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
