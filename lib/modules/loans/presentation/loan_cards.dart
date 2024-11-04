import 'package:flutter/material.dart';

import 'package:bankdash/modules/account/barrel.dart';

class LoanCards extends StatelessWidget {
  const LoanCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: CarouselView(
        itemExtent: MediaQuery.of(context).size.width * 0.7,
        shrinkExtent: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(20),
        children: const [
          AccountCard(
            color: Colors.blue,
            title: "Personal Loans",
            balance: 1000,
            icon: Icons.person,
          ),
          AccountCard(
            color: Colors.yellow,
            title: "Credit Cards",
            balance: 5000,
            icon: Icons.wallet,
          ),
        ],
      ),
    );
  }
}
