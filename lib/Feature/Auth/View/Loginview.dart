// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Feature/Auth/View/Signupview.dart';
import 'package:busapp/Feature/Auth/Viewmodel/Auth_viewmodel.dart';
import 'package:busapp/Feature/Auth/widget/Texinput.dart';
import 'package:busapp/Feature/Auth/widget/othersignincard.dart';
import 'package:busapp/Feature/Auth/widget/socialbutton.dart';
import 'package:busapp/Feature/home/View/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 156, 190, 235),
              Color.fromARGB(255, 231, 196, 143),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 12, 48, 207),
              ),
            ),
            Text(
              "Your journey through Punjab starts here",
              style: TextStyle(fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 19,
                left: 10,
                right: 10,
                bottom: 15,
              ),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 240, 233, 233),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Texinput(
                        controller: email,
                        rowtext: 'Enter  Email',
                        icon: Icon(Icons.email),
                        text: 'yourjhon@gmail.com',
                      ),
                      Texinput(
                        controller: password,
                        icon: Icon(Icons.password),
                        rowtext: 'Enter Password ',
                        text: 'Password',
                      ),
                      SizedBox(height: 10),
                      Consumer<AuthViewmodel>(
                        builder: (context, uiload, _) {
                          return uiload.state.isloading == true
                              ? const CircularProgressIndicator()
                              : Socialbutton(
                                  buttontext: 'Login',
                                  buttoncolor: const Color.fromARGB(
                                    255,
                                    28,
                                    49,
                                    235,
                                  ),
                                  buttontextcolor: Colors.white,
                                  ontap: () async {
                                    final success = await context
                                        .read<AuthViewmodel>()
                                        .login(
                                          email.text.trim(),
                                          password.text.trim(),
                                        );
                                    if (!context.mounted) return;

                                    if (!success) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            context
                                                    .read<AuthViewmodel>()
                                                    .state
                                                    .error ??
                                                "Login failed",
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                        },
                      ),

                      SizedBox(height: 10),
                      Text("____________OR CONTINUE WITH________________"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Othersignincard(
                            imagePath: 'asset/image/google.png',
                            logname: 'Google',
                            otherlogintap: () {
                              print("object");
                            },
                          ),
                          Othersignincard(
                            imagePath: 'asset/image/apple.png',
                            logname: 'Apple',
                            otherlogintap: () {
                              print("2");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to Punjab Transit?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text(
                      "Create An Account",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
