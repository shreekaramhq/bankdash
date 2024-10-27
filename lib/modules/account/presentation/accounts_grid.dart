import 'package:flutter/material.dart';

import 'widgets/account_card.dart';

class AccountsGrid extends StatelessWidget {
  const AccountsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: const [
        AccountCard(
          color: Colors.yellow,
          title: "My Balance",
          balance: 1000,
          icon: Icons.account_balance_wallet,
        ),
        AccountCard(
          color: Colors.blue,
          title: "Income",
          balance: 5000,
          icon: Icons.wallet_rounded,
        ),
        AccountCard(
          color: Colors.red,
          title: "Expenses",
          balance: 3000,
          icon: Icons.money,
        ),
        AccountCard(
          color: Colors.green,
          title: "Savings",
          balance: 2000,
          icon: Icons.savings,
        ),
      ],
    );
  }
}
