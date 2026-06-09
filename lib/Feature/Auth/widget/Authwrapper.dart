import 'package:busapp/Feature/Auth/View/Loginview.dart';
import 'package:busapp/Feature/home/View/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print("===== AUTH WRAPPER =====");
        print("Connection: ${snapshot.connectionState}");
        print("Has Data: ${snapshot.hasData}");
        print("User: ${snapshot.data?.email}");

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const Homeview();
        }

        return const Loginview();
      },
    );
  }
}