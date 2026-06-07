// ignore_for_file: unused_import

import 'package:busapp/Core/routes/Approutes.dart';
import 'package:busapp/Feature/Auth/Viewmodel/AuthViewmodel.dart';
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
            await context.read<Authviewmodel>().logout();
            Navigator.pushNamed(context, Approutes.login);
          },
          child: Text("logout"),
        ),
      ),
    );
  }
}
