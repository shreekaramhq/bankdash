import 'package:bankdash/modules/cards/presentation/cards_list_view.dart';
import 'package:go_router/go_router.dart';

import 'screens/accounts_screen.dart';
import 'screens/home_screen.dart';
import 'screens/overview_screen.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const OverviewScreen(),
        ),
        GoRoute(
          path: '/accounts',
          builder: (context, state) => const AccountsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsListView(),
    ),
  ],
);
