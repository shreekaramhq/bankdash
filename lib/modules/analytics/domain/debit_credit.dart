class DebitCredit {
  final String id;
  final double creditAmount;
  final double debitAmount;
  final DateTime date;

  DebitCredit({
    required this.id,
    required this.date,
    required this.creditAmount,
    required this.debitAmount,
  });
}
