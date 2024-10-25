import 'package:flutter/material.dart';

import 'package:bankdash/modules/transactions/barrel.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;
  const TabItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: FontWeight.bold,
          decoration:
              isSelected ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}

class TransactionsGroups extends StatefulWidget {
  const TransactionsGroups({super.key});

  @override
  State<TransactionsGroups> createState() => _TransactionsGroupsState();
}

class _TransactionsGroupsState extends State<TransactionsGroups> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Transactions",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TabItem(
              title: "All Transactions",
              isSelected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            TabItem(
              title: "Income",
              isSelected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            TabItem(
              title: "Expenses",
              isSelected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 350,
          child: IndexedStack(
            index: currentIndex,
            children: [
              TransactionsList(transactionList: transactionsList),
              TransactionsList(
                  transactionList: transactionsList
                      .where(
                        (transaction) =>
                            transaction.type == TransactionType.income,
                      )
                      .toList()),
              TransactionsList(
                  transactionList: transactionsList
                      .where(
                        (transaction) =>
                            transaction.type == TransactionType.expense,
                      )
                      .toList()),
            ],
          ),
        )
      ],
    );
  }
}
