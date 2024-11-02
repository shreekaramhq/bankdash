import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:bankdash/modules/analytics/barrel.dart';

class CardExpenseStatistics extends StatelessWidget {
  const CardExpenseStatistics({super.key});

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      const fontSize = 16.0;
      const radius = 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 30,
            showTitle: false,
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.pinkAccent,
            value: 30,
            showTitle: false,
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: 20,
            radius: radius,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.orangeAccent,
            value: 20,
            radius: radius,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Card Expense Statistics",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                  startDegreeOffset: 160,
                ),
              ),
            ),
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(
                  color: Colors.blue,
                  text: 'DBL Bank',
                  isSquare: false,
                ),
                SizedBox(width: 20),
                Indicator(
                  color: Colors.pinkAccent,
                  text: 'BRC Bank',
                  isSquare: false,
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(
                  color: Colors.greenAccent,
                  text: 'ABM Bank',
                  isSquare: false,
                ),
                SizedBox(width: 20),
                Indicator(
                  color: Colors.orangeAccent,
                  text: 'MCP Bank',
                  isSquare: false,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
