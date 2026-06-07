import 'package:busapp/Feature/Auth/View/Loginview.dart';
import 'package:busapp/Feature/home/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authwarpper extends StatelessWidget {
  const Authwarpper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return const Homeview();
        }
        return Loginview();
      },
    );
  }
}
