import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 56.0;
  final String title;
  final Function() onMenuTap;
  const HomeAppBar({super.key, required this.onMenuTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: InkWell(
        onTap: onMenuTap,
        child: const Icon(Icons.menu),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
