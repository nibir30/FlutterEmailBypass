import 'package:flutter/material.dart';
import 'package:test_assignment/features/dashboard/presentation/pages/home_page.dart';
import 'package:test_assignment/features/signUp/presentation/pages/sign_up_page.dart';
import 'package:test_assignment/features/startup/presentation/pages/startup_page.dart';

import '../features/logIn/presentation/pages/login_page.dart';
import 'routing_variables.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Navigation.startup:
        return MaterialPageRoute(builder: (_) => StartupPage());
      case Navigation.homePage:
        return MaterialPageRoute(builder: (_) => DashBoardPage());
      case Navigation.authPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Navigation.regPage:
        return MaterialPageRoute(builder: (_) => SignUpPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
