import 'package:flutter/material.dart';

import 'package:bankdash/modules/investments/barrel.dart';
import 'widgets/home_app_bar.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: HomeAppBar(
        title: "Investments",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: const CustomScrollView(
            slivers: [
              InvestmentTiles(),
              SliverToBoxAdapter(child: SizedBox(height: 40)),
              SliverToBoxAdapter(child: MonthlyRevenue()),
              SliverToBoxAdapter(child: SizedBox(height: 60)),
            ],
          ),
        ),
      ),
    );
  }
}
