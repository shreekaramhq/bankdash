import 'package:flutter/material.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final int value;
  const InvestmentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      tileColor: Colors.white,
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.orange.withOpacity(0.2),
        ),
        child: Icon(icon),
      ),
      trailing: Text(
        "${value > 0 ? '+' : ''}$value%",
        style: TextStyle(
          color: value > 0 ? Colors.green : Colors.red,
          fontSize: 18,
        ),
      ),
    );
  }
}

class MyInvestments extends StatelessWidget {
  const MyInvestments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Investments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        InvestmentCard(
          title: "Apple Stocks",
          subtitle: "E-commerce, Marketplace",
          icon: Icons.apple,
          value: 16,
        ),
        SizedBox(height: 16),
        InvestmentCard(
          title: "Samsung Stocks",
          subtitle: "Electronics, Hardware",
          icon: Icons.mobile_friendly,
          value: -4,
        ),
        SizedBox(height: 16),
        InvestmentCard(
          title: "Tesla Stocks",
          subtitle: "Electric Vehicles, Energy",
          icon: Icons.car_rental,
          value: 25,
        ),
      ],
    );
  }
}
