// ignore_for_file: unused_import

import 'package:busapp/Feature/Auth/widget/Texinput.dart';
import 'package:busapp/Feature/Auth/widget/socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create Account",
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 12, 48, 207),
            ),
          ),

          const Text("Your journey through Punjab starts here"),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Texinput(
                      controller: email,
                      rowtext: 'Enter Email',
                      icon: const Icon(Icons.email),
                      text: 'yourjhon@gmail.com',
                    ),
                    Texinput(
                      controller: password,
                      icon: const Icon(Icons.password),
                      rowtext: 'Enter Password',
                      text: 'Password',
                    ),

                    const SizedBox(height: 10),

                    Socialbutton(
                      buttontext: 'Sign Up',
                      buttoncolor: const Color.fromARGB(255, 28, 49, 235),
                      buttontextcolor: Colors.white,
                      ontap: () async {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              "Already have an account? Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
