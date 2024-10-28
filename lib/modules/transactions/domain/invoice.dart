import 'package:intl/intl.dart';

class Invoice {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final String currency;

  Invoice({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.currency = "\$",
  });
}

extension InvoiceX on Invoice {
  String get formattedDate => DateFormat("dd MMMM yyyy").format(date);
  String get formattedAmount => "$currency${amount.round()}";
}
