import 'package:busapp/Feature/Auth/widget/Texinput.dart';
import 'package:busapp/Feature/Auth/widget/othersignincard.dart';
import 'package:busapp/Feature/Auth/widget/socialbutton.dart';
import 'package:flutter/material.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController Password = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
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
                color: const Color.fromARGB(255, 255, 255, 255),
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
                      controller: Password,
                      icon: Icon(Icons.password),
                      rowtext: 'Enter Password ',
                      text: 'Password',
                    ),
                    SizedBox(height: 10),

                    Socialbutton(
                      buttontext: 'Sign Up',
                      buttoncolor: const Color.fromARGB(255, 28, 49, 235),
                      buttontextcolor: const Color.fromARGB(255, 255, 255, 255),
                      ontap: () async {},
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signupview()),
                    );
                  },
                  child: Text(
                    "Already have Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
