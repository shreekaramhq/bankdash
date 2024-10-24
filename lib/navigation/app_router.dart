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
          pageBuilder: (context, state) => const NoTransitionPage(
            child: OverviewScreen(),
          ),
        ),
        GoRoute(
          path: '/accounts',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsListView(),
    ),
  ],
);
