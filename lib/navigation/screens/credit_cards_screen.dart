import 'package:flutter/material.dart';

import 'package:bankdash/modules/cards/barrel.dart';

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("Credit Cards",
                  style: TextStyle(color: Colors.black)),
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              forceElevated: false,
              scrolledUnderElevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const SearchBar(
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(Color(0xFFF5F7FA)),
                    leading: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(Icons.search),
                    ),
                    hintText: "Search for something",
                  ),
                ),
              ),
            ),
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
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const NewCardForm(),
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
