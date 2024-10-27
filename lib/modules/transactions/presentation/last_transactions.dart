import 'package:flutter/material.dart';

import '../data/transactions_list.dart';
import 'recent_transactions.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Last Transactions",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        TransactionsList(transactionList: transactionsList),
      ],
    );
  }
}
