import 'package:dvp_test/features/home/presentation/pages/home_page.dart';
import 'package:dvp_test/features/login/presentation/pages/login_page.dart';
import 'package:dvp_test/features/register/presentation/pages/register_page.dart';
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
    Routes.login: login,
    Routes.register: register,
    Routes.home: home,
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
      case _Page.register:
        return _pageRoute(
          page: const RegisterPage(),
          routeSettings: settings,
        );
      case _Page.home:
        return _pageRoute(
          page: const HomeScreen(),
          routeSettings: settings,
        );
      default:
        return _pageRoute(
          page: const LoginPage(),
          routeSettings: settings,
        );
    }
  }

  static Future push<T>(Routes route, {Map<String, dynamic>? arguments}) =>
      state.pushNamed(_Page.page(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, {arguments}) =>
      state.pushNamedAndRemoveUntil(_Page.page(route)!, (Route routes) => false,
          arguments: arguments);

  static void pop({Map<String, dynamic>? params}) => state.pop(params);

  static void popToHome() => state.popUntil((route) => route.isFirst);
}
