import 'package:flutter/material.dart';

import '../data/transactions_list.dart';
import '../domain/transaction.dart';
import 'widgets/transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactionList;
  const TransactionsList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: transactionList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final transaction = transactionList[index];

        return TransactionCard(transaction: transaction);
      },
    );
  }
}

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
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: TransactionsList(transactionList: transactionsList),
        ),
      ],
    );
  }
}
