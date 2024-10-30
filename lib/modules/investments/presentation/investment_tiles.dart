import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widgets/investment_tile.dart';

class InvestmentTiles extends StatelessWidget {
  const InvestmentTiles({super.key});

  @override
  Widget build(BuildContext context) {
    const desktop = '''
      total number rate
      total number rate
      total number rate
    ''';

    const mobile = '''
      total total  total
      number number  number
      rate rate  rate
    ''';

    final layout =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo('SMALL_DESKTOP')
            ? mobile
            : desktop;

    return LayoutGrid(
      areas: layout,
      columnSizes: [1.fr, 1.fr, 1.fr],
      rowSizes: const [auto, auto, auto],
      columnGap: 20,
      rowGap: 20,
      children: [
        const InvestmentTile(
          color: Colors.yellow,
          title: "Total Investmented Amount",
          subtitle: "\$1000",
          icon: Icons.account_balance_wallet,
        ).inGridArea('total'),
        const InvestmentTile(
          color: Colors.pink,
          title: "Number of Investments",
          subtitle: "1,250",
          icon: Icons.pie_chart,
        ).inGridArea('number'),
        const InvestmentTile(
          color: Colors.blue,
          title: "Rate of Return",
          subtitle: "+8.6%",
          icon: Icons.repeat,
        ).inGridArea('rate'),
      ],
    );
  }
}
