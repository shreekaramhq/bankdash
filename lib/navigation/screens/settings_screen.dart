import 'package:flutter/material.dart';

import 'package:bankdash/modules/settings/barrel.dart';

import 'widgets/home_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (ctx, innerBoxIsScrolled) {
            return [
              HomeAppBar(
                title: "Settings",
                onMenuTap: () {
                  Scaffold.of(context).openDrawer();
                },
              )
            ];
          },
          body: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    tabs: [
                      Tab(text: "Edit profile"),
                      Tab(text: "Preference"),
                      Tab(text: "Security"),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      ProfileView(),
                      Text("Preference"),
                      Text("Security"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
