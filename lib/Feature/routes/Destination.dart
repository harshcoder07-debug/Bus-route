import 'package:flutter/material.dart';

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destination'),
      ),
      body: const Center(
        child: Text('Destination Content'),
      ),
    );
  }
}