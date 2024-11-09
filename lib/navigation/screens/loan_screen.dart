import 'package:flutter/material.dart';

import 'package:bankdash/modules/loans/barrel.dart';

import 'widgets/home_app_bar.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            HomeAppBar(
              title: "Loans",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          ];
        },
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: LoanCards()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ActiveLoansOverview(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
