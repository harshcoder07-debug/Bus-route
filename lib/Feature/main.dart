import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Data/Repository/repository.dart';
import 'package:busapp/Feature/Auth/Viewmodel/Auth_viewmodel.dart';
import 'package:busapp/Feature/Auth/widget/Authwrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel(AuthRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        home: const AuthWrapper(),
      ),
    );
  }
}
