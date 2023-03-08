import 'package:dvp_test/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

enum Routes {
  initial,
  login,
  register,
  home,
}

class _Page {
  static const String initial = "/";
  static const String login = "login";
  static const String register = "register";
  static const String home = "home";

  static const Map<Routes, String> _pageMap = {
    Routes.initial: initial,
    Routes.login: initial,
    Routes.register: initial,
    Routes.home: initial,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

Route _pageRoute({
  required Widget page,
  RouteSettings? routeSettings,
}) {
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (BuildContext context) => page,
  );
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Page.initial:
        return _pageRoute(
          page: const LoginPage(),
          routeSettings: settings,
        );
      default:
        return _pageRoute(
          page: const LoginPage(),
          routeSettings: settings,
        );
    }
  }
}
