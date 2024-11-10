import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 70.0;
  final String title;
  final Function() onMenuTap;
  const HomeAppBar({super.key, required this.onMenuTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title, style: const TextStyle(color: Colors.black)),
      pinned: true,
      floating: true,
      backgroundColor: Colors.white,
      forceElevated: false,
      scrolledUnderElevation: 0,
      leading: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuTap,
            )
          : null,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: const SearchBar(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Color(0xFFF5F7FA)),
            leading: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(Icons.search),
            ),
            hintText: "Search for something",
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
