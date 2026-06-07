// ignore_for_file: unused_import

import 'package:busapp/Core/Services/Auth_service.dart';
import 'package:busapp/Core/routes/Approuter.dart';
import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Data/Repository/Authrepository.dart';
import 'package:busapp/Feature/Auth/View/Loginview.dart';
import 'package:busapp/Feature/Auth/Viewmodel/AuthViewmodel.dart';
import 'package:busapp/Feature/Auth/widget/Authwarpper.dart';

import 'package:busapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Authviewmodel(Authrepository(AuthService())),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authwarpper(),
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
