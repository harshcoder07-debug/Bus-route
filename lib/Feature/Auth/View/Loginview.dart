import 'package:busapp/Feature/Auth/widget/Texinput.dart';
import 'package:busapp/Feature/Auth/widget/othersignincard.dart';
import 'package:busapp/Feature/Auth/widget/socialbutton.dart';
import 'package:flutter/material.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              Text("Your journey through Punjab starts here"),
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
                          rowtext: 'Enter  Eamil',
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
                        Socialbutton(
                          buttontext: 'Login',
                          buttoncolor: const Color.fromARGB(255, 28, 49, 235),
                          buttontextcolor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          ontap: () {},
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
                            ),
                            Othersignincard(
                              imagePath: 'asset/image/apple.png',
                              logname: 'Apple',
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
                        
                      },
                      child: Text(
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
      ),
    );
  }
}
