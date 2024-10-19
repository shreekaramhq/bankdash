import 'package:intl/intl.dart';

enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final String currency;
  final TransactionType type;
  final String accountId;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
    required this.accountId,
    this.currency = "\$",
  });
}

extension TransactionX on Transaction {
  String get formattedDate => DateFormat("dd MMMM yyyy").format(date);
  String get formattedAmount =>
      "${type == TransactionType.income ? "+" : "-"}$currency${amount.round()}";
}
