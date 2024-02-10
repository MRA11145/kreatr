import 'package:flutter/material.dart';
import 'package:kreatr_app/screens/deatils_screen.dart';
import 'package:kreatr_app/screens/home_screen.dart';

class ScreenTrans {
  static Route detailsScreen() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: DetailsScreen.routeName),
      pageBuilder: (context, animation, secondaryAnimation) => const DetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route homeScreen() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: HomeScreen.routeName),
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
