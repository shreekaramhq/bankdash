import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'widget/indicator.dart';

import '../data/expenses_list.dart';
import '../domain/expense.dart';

class ExpenseStatistics extends StatelessWidget {
  const ExpenseStatistics({super.key});

  List<PieChartSectionData> showingSections() {
    final totalAmount = expensesList.fold(
      0.0,
      (value, element) => value + element.amount,
    );

    return expensesList.map((expense) {
      final percentage = expense.amount / totalAmount * 100;

      return PieChartSectionData(
        color: expense.category.color,
        value: percentage,
        title: "${percentage.toStringAsFixed(2)}%",
        radius: expense.category.radius,
        titlePositionPercentageOffset: 0.6,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Expense Statistics",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: expensesList.map(
              (expense) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Indicator(
                    color: expense.category.color,
                    text: expense.category.title,
                    isSquare: true,
                  ),
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                  ),
                  startDegreeOffset: 80,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 8,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
