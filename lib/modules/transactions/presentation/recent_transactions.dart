import 'package:flutter/material.dart';

import '../data/transactions_list.dart';
import 'widgets/transaction_card.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Transactions",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final transaction = transactionList[index];

            return TransactionCard(transaction: transaction);
          },
        ),
      ],
    );
  }
}
