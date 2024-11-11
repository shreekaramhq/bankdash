import 'package:bankdash/theme/barrel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'navigation/app_router.dart';

class BankDash extends StatelessWidget {
  const BankDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          drawerTheme: const DrawerThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F7FA),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.infinity, 54),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                side: BorderSide(color: Colors.black),
              ),
              backgroundColor: AppColors.blueColor,
              foregroundColor: Colors.white,
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      routerConfig: appRouter,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1220, name: "SMALL_DESKTOP"),
          const Breakpoint(start: 1221, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
