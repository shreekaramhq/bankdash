import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerItem {
  const DrawerItem({required this.title, required this.route});
  final String title;
  final String route;
}

const drawerItems = [
  DrawerItem(title: 'Overview', route: '/'),
  DrawerItem(title: 'Transactions', route: '/transactions'),
  DrawerItem(title: 'Accounts', route: '/accounts'),
  DrawerItem(title: 'Investments', route: '/investments'),
  DrawerItem(title: 'Credit Cards', route: '/credit-cards'),
  DrawerItem(title: 'Loans', route: '/loans'),
  DrawerItem(title: 'Services', route: '/services'),
  DrawerItem(title: 'Settings', route: '/settings'),
];

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Bank Dash'),
            ),
            for (final item in drawerItems)
              ListTile(
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context);
                  context.go(item.route);
                },
              ),
          ],
        ),
      ),
    );
  }
}
