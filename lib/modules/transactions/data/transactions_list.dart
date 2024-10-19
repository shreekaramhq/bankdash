import 'package:bankdash/modules/transactions/domain/transaction.dart';

final transactionList = [
  Transaction(
    id: "1",
    title: "Salary",
    date: DateTime.now(),
    amount: 5000,
    type: TransactionType.income,
    accountId: "1",
  ),
  Transaction(
    id: "2",
    title: "Rent",
    date: DateTime.now().subtract(const Duration(days: 2)),
    amount: 1000,
    type: TransactionType.expense,
    accountId: "1",
  ),
  Transaction(
    id: "3",
    title: "YouTube Ad Revenue",
    date: DateTime.now().subtract(const Duration(days: 1)),
    amount: 200,
    type: TransactionType.income,
    accountId: "2",
  ),
];
