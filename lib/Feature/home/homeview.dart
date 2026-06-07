
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
