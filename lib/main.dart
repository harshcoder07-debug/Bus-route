// ignore_for_file: unused_import

import 'package:busapp/Core/routes/Approuter.dart';
import 'package:busapp/Core/routes/Approutes.dart';

import 'package:busapp/Feature/Auth/View/Loginview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Loginview());
  }
}
