import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

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
