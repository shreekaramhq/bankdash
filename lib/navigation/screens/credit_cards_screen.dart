import 'package:bankdash/modules/cards/barrel.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Credit Cards",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CardsViewer(),
            ),
          ],
        ),
      ),
    );
  }
}
