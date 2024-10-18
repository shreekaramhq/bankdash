class DashCard {
  final String id;
  final String holderName;
  final DateTime validThru;
  final String cardNumber;
  final String cardType;
  final double balance;
  final String currency = "\$";

  DashCard({
    required this.id,
    required this.holderName,
    required this.validThru,
    required this.cardNumber,
    required this.cardType,
    required this.balance,
  });
}
