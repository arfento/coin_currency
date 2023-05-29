import 'package:coin_currency/config/services/navigation/routes.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  const NavigationService();

  void openSplashPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.splash)
          : Navigator.pushNamed(context, NavigationRoutes.splash);
  void openIntroPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.intro)
          : Navigator.pushNamed(context, NavigationRoutes.intro);
  void openHomePage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.home)
          : Navigator.pushNamed(context, NavigationRoutes.home);

  void back(BuildContext context, {dynamic result}) =>
      Navigator.pop(context, result);
}
