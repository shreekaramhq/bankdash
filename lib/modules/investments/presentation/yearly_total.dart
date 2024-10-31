import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

final _years = ['2016', '2017', '2018', '2019', '2020', '2021'];

class YearlyTotal extends StatelessWidget {
  const YearlyTotal({super.key});

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
        reservedSize: 40,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    if (value.toInt() == 0) {
      return Container();
    }

    return Text("\$${value.toInt()}0k",
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
      child: Text(_years[value.toInt()], style: style),
    );
  }

  LineChartBarData get lineBarsData => LineChartBarData(
        isCurved: true,
        color: Colors.orange.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        curveSmoothness: 0,
        spots: const [
          FlSpot(0.5, 0.5),
          FlSpot(1, 2.2),
          FlSpot(2, 1.5),
          FlSpot(3, 3.5),
          FlSpot(4, 2),
          FlSpot(5, 3),
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
            "Yearly Total Investment",
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
                  maxX: 5,
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
