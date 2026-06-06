import 'package:flutter/material.dart';

class Socialbutton extends StatelessWidget {
  final String buttontext;
  final Color buttoncolor;
  final Color buttontextcolor;
  final VoidCallback ontap;
  const Socialbutton({
    super.key,
    required this.buttontext,
    required this.buttoncolor,
    required this.buttontextcolor,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.50),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4), // x, y
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttontext,
            style: TextStyle(
              color: buttontextcolor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
