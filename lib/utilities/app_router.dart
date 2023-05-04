import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/screens/admin_screen.dart';
import 'package:vending_app_poc/presentation/screens/home_screen.dart';
import 'package:vending_app_poc/presentation/screens/link_screen.dart';
import 'package:vending_app_poc/presentation/screens/login_%20screen.dart';
import 'package:vending_app_poc/presentation/screens/register_screen.dart';
import 'package:vending_app_poc/presentation/screens/user_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case "/admin":
        return MaterialPageRoute(
          builder: (_) => const AdminScreen(
            title: "Admin",
          ),
        );
      case "/user":
        return MaterialPageRoute(
          builder: (_) => const UserScreen(),
        );
      case "/link":
        var data = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => LinkScreen(
            initialLink: data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
