import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 56.0;
  final String title;
  final Function() onMenuTap;
  const HomeAppBar({super.key, required this.onMenuTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.white,
      leading: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? InkWell(
              onTap: onMenuTap,
              child: const Icon(Icons.menu),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
