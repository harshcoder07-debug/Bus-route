import 'package:flutter/material.dart';
import 'package:busapp/Feature/Auth/View/Loginview.dart';
import 'package:busapp/Feature/Auth/View/Signupview.dart';
import 'package:busapp/Feature/home/View/homeview.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const Loginview(),
    signup: (_) => const Signupview(),
    home: (_) => const Homeview(),
  };
}