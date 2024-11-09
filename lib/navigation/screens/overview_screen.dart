import 'package:bankdash/modules/analytics/barrel.dart';
import 'package:bankdash/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:bankdash/modules/cards/barrel.dart';
import 'package:bankdash/modules/transactions/barrel.dart';

import 'widgets/home_app_bar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  renderMobile() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.only(left: 20),
            child: const CardsSlider(),
          ),
          const SizedBox(height: 20),
          Container(
            height: 300,
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
    );
  }

  renderDesktop() {
    return SliverToBoxAdapter(
      child: LayoutGrid(
        areas: '''
          cards cards  recent
          weekly weekly statistics
          history history blank
        ''',
        columnSizes: [1.fr, 1.fr, 1.fr],
        rowSizes: [
          300.px,
          auto,
          auto,
        ],
        columnGap: 24,
        rowGap: 24,
        children: [
          const CardsSlider().inGridArea('cards'),
          const RecentTransactions().inGridArea('recent'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            child: const WeeklyActivity(),
          ).inGridArea("weekly"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 350,
            child: const ExpenseStatistics(),
          ).inGridArea("statistics"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            width: 800,
            child: const BalanceHistory(),
          ).inGridArea("history"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            HomeAppBar(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              title: "Overview",
            )
          ];
        },
        body: CustomScrollView(
          slivers: [
            ResponsiveBreakpoints.of(context).equals(DESKTOP)
                ? renderDesktop()
                : renderMobile()
          ],
        ),
      ),
    );
  }
}
