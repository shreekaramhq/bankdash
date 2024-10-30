import 'package:flutter/material.dart';

import 'package:bankdash/modules/investments/barrel.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'widgets/home_app_bar.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  final revenue = const MonthlyRevenue();

  final total = const Text("Total Investmented Amount");

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
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: InvestmentTiles()),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
              SliverToBoxAdapter(
                child: ResponsiveRowColumn(
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  layout: ResponsiveValue(
                    context,
                    conditionalValues: [
                      const Condition.smallerThan(
                          name: 'SMALL_DESKTOP',
                          value: ResponsiveRowColumnType.COLUMN),
                    ],
                    defaultValue: ResponsiveRowColumnType.ROW,
                  ).value,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowFit: FlexFit.tight,
                      child: revenue,
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowFit: FlexFit.tight,
                      child: total,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 60)),
            ],
          ),
        ),
      ),
    );
  }
}