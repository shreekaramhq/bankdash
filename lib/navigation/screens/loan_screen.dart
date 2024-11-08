import 'package:bankdash/modules/loans/barrel.dart';
import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("Loans", style: TextStyle(color: Colors.black)),
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