import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Accounts",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: const Center(
        child: Text('Accounts'),
      ),
    );
  }
}
