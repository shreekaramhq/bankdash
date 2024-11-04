import 'package:bankdash/navigation/screens/loan_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:bankdash/modules/cards/barrel.dart';
import 'screens/accounts_screen.dart';
import 'screens/credit_cards_screen.dart';
import 'screens/home_screen.dart';
import 'screens/investments_screen.dart';
import 'screens/overview_screen.dart';
import 'screens/transactions_screen.dart';

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
          path: '/transactions',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TransactionsScreen(),
          ),
        ),
        GoRoute(
          path: '/accounts',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountsScreen(),
          ),
        ),
        GoRoute(
          path: '/investments',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: InvestmentsScreen(),
          ),
        ),
        GoRoute(
          path: '/credit-cards',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CreditCardsScreen(),
          ),
        ),
        GoRoute(
          path: '/loans',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LoanScreen(),
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
