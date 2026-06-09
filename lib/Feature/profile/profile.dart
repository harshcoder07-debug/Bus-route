import 'package:busapp/Feature/Auth/Viewmodel/Auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ElevatedButton(
        onPressed: () {
          final vm = context.read<AuthViewmodel>().logout();
        },
        child: const Text("Logout"),
      ),
    );
  }
}
