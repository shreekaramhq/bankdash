import 'package:bankdash/modules/loans/domain/loan.dart';
import 'package:flutter/material.dart';

import '../data/loans.dart';

class ActiveLoansOverview extends StatelessWidget {
  const ActiveLoansOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final total = loans
        .fold<double>(
          0,
          (previousValue, element) => previousValue + element.amount,
        )
        .round();
    final totalLeftToRepay = loans
        .fold<double>(
          0,
          (previousValue, element) => previousValue + element.leftToRepay,
        )
        .round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Active Loans Overview", style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(
                        "Loan Money",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(
                        "Left to Repay",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(
                        "Repay",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
              for (final loan in loans)
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  children: [
                    TableCell(child: Text(loan.formattedAmount)),
                    TableCell(
                      child: Text(loan.formattedLeftToRepay),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TableCell(
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            side: WidgetStatePropertyAll(
                              BorderSide(color: Colors.blue, width: 2),
                            ),
                            elevation: WidgetStatePropertyAll(0),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {},
                          child: const Text("Repay"),
                        ),
                      ),
                    ),
                  ],
                ),
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(
                        "Total \n \$$total",
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(
                        "\n \$$totalLeftToRepay",
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TableCell(
                      child: Text(""),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
