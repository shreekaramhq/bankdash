import 'package:bankdash/modules/account/presentation/accounts_grid.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
        title: "Accounts",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AccountsGrid()),
          ],
        ),
      ),
    );
  }
}
