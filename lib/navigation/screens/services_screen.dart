import 'package:flutter/material.dart';

import 'package:bankdash/modules/services/barrel.dart';

import 'widgets/home_app_bar.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            HomeAppBar(
              title: "Services",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          ];
        },
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ServicesCarousel()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
