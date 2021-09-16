import 'package:flutter/material.dart';
import 'package:tweether_2/landing_page.dart';
import 'package:tweether_2/signup_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/landing_page':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/signup_page':
        return MaterialPageRoute(builder: (_) => SignupPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
