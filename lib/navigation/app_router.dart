import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/accounts_screen.dart';
import 'screens/home_screen.dart';
import 'screens/widgets/home_app_bar.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Overview",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: const Center(
        child: Text('Overview'),
      ),
    );
  }
}

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const OverviewPage(),
        ),
        GoRoute(
          path: '/accounts',
          builder: (context, state) => const AccountsScreen(),
        ),
      ],
    ),
  ],
);
