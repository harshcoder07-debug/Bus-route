import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Data/Repository/repository.dart';
import 'package:busapp/Feature/Auth/Viewmodel/Auth_viewmodel.dart';
import 'package:busapp/Feature/Auth/widget/Authwrapper.dart';
import 'package:busapp/Feature/Provider/Providersetup.dart';
import 'package:busapp/Feature/Search/viewmodel/Bus%20Search_Viewmodel.dart';
import 'package:busapp/Feature/home/Viewmodel/DestinationViewModel.dart';
import 'package:busapp/Feature/home/Viewmodel/homeviewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: buildProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        home: const AuthWrapper(),
      ),
    );
  }
}
