import 'package:bankdash/modules/account/presentation/accounts_grid.dart';
import 'package:bankdash/modules/analytics/barrel.dart';
import 'package:bankdash/modules/cards/barrel.dart';
import 'package:bankdash/modules/transactions/barrel.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: HomeAppBar(
        title: "Accounts",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: AccountsGrid()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 260,
                child: RecentTransactions(),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 260,
                child: CardsSlider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 300,
                child: const DebitCreditOverview(),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }
}
