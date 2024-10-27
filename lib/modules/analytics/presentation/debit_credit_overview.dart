import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/debit_credit_list.dart';

class DebitCreditOverview extends StatelessWidget {
  const DebitCreditOverview({super.key});

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final Widget text = Text(
      titles[value.toInt() - 1],
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: const SizedBox.shrink(),
    );
  }

  dataGroups() {
    return debitCreditList.map((debitCredit) {
      return BarChartGroupData(
        x: debitCredit.date.weekday,
        barRods: [
          BarChartRodData(
            toY: debitCredit.creditAmount / 100,
            color: Colors.green,
          ),
          BarChartRodData(
            toY: debitCredit.debitAmount / 100,
            color: Colors.red,
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Debit & Credit Overview",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Credit",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Debit",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 10,
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
                            reservedSize: 30,
                            interval: 1,
                            maxIncluded: true,
                            minIncluded: true,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: dataGroups(),
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
