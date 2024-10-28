import 'package:flutter/material.dart';

import 'widgets/investment_tile.dart';

class InvestmentTiles extends StatelessWidget {
  const InvestmentTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const InvestmentTile(
            color: Colors.yellow,
            title: "Total Investmented Amount",
            subtitle: "\$1000",
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: 20),
          const InvestmentTile(
            color: Colors.pink,
            title: "Number of Investments",
            subtitle: "1,250",
            icon: Icons.pie_chart,
          ),
          const SizedBox(height: 20),
          const InvestmentTile(
            color: Colors.blue,
            title: "Rate of Return",
            subtitle: "+8.6%",
            icon: Icons.repeat,
          )
        ],
      ),
    );
  }
}
