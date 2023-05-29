import 'package:coin_currency/presentation/pages/intro_page.dart';
import 'package:coin_currency/presentation/pages/splash_page.dart';
import 'package:coin_currency/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class NavigationRoutes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NavigationRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case NavigationRoutes.intro:
      return MaterialPageRoute(builder: (_) => const IntroPage());
    case NavigationRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomePage());

    default:
      throw 'Invalid route';
  }
}
