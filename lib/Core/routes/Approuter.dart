import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Feature/Auth/View/Loginview.dart';
import 'package:busapp/Feature/Auth/View/Signupview.dart';
import 'package:busapp/Feature/home/homeview.dart';
import 'package:flutter/material.dart';





class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Approutes.login:
        return MaterialPageRoute(
          builder: (_) => const Loginview(),
        );

      case Approutes.signup:
        return MaterialPageRoute(
          builder: (_) => const Signupview(),
        );

      case Approutes.home:
        return MaterialPageRoute(
          builder: (_) => const Homeview(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page Not Found")),
          ),
        );
    }
  }
}