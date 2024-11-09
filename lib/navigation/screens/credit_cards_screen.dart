import 'package:flutter/material.dart';

import 'package:bankdash/modules/cards/barrel.dart';
import 'widgets/home_app_bar.dart';

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            HomeAppBar(
              title: "Credit Cards",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          ];
        },
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CardsViewer(),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 380,
                child: const CardExpenseStatistics(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 30),
                child: const CardList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 20),
                child: const NewCardForm(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const CardSettings(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
