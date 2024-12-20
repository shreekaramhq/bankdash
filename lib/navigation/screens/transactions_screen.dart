import 'package:bankdash/modules/cards/barrel.dart';
import 'package:bankdash/modules/transactions/barrel.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) => [
          HomeAppBar(
            title: "Transactions",
            onMenuTap: () {
              Scaffold.of(context).openDrawer();
            },
          )
        ],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 255,
                    padding: const EdgeInsets.only(left: 20),
                    child: const CardsSlider(),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TransactionsGroups(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
