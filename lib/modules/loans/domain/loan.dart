class Loan {
  final String id;
  final double amount;
  final double leftToRepay;

  Loan({
    required this.id,
    required this.amount,
    required this.leftToRepay,
  });
}

extension LoanX on Loan {
  String get formattedAmount => "\$${amount.round()}";
  String get formattedLeftToRepay => "\$${leftToRepay.round()}";
}
