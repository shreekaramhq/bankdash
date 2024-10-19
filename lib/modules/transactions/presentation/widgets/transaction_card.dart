import 'package:flutter/material.dart';

import '../../domain/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          transaction.type == TransactionType.income
              ? Icons.arrow_downward
              : Icons.arrow_upward,
        ),
      ),
      title: Text(transaction.title),
      subtitle: Text(transaction.formattedDate),
      trailing: Text(
        transaction.formattedAmount,
        style: TextStyle(
          color: transaction.type == TransactionType.income
              ? Colors.green
              : Colors.red,
          fontSize: 16,
        ),
      ),
    );
  }
}
