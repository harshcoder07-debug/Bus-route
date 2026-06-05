
import 'package:flutter/material.dart';

class Texinput extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String text;
  final String rowtext;
  const Texinput({
    super.key,
    required this.controller,
    required this.icon,
    required this.rowtext,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rowtext,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon,
              hintText: text,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
