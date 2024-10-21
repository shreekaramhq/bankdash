import 'package:bankdash/modules/analytics/barrel.dart';
import 'package:flutter/material.dart';

import 'package:bankdash/modules/cards/barrel.dart';
import 'package:bankdash/modules/transactions/barrel.dart';

import 'widgets/home_app_bar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Overview",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardsSlider(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const RecentTransactions(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              child: const WeeklyActivity(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              child: const ExpenseStatistics(),
            ),
          ],
        ),
      ),
    );
  }
}
