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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: const ExpenseStatistics(),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 600,
                width: 800,
                child: const BalanceHistory(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
